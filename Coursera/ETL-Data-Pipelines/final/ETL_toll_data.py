# -*- coding: utf-8 -*-
"""
Created on Mon Nov 28 17:27:17 2022

@author: H204095
"""


from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

#define DAG arguments
default_args = {
    'owner': 'Lianlin Chi',
    'start_date': days_ago(0),
    'email': 'chi.lianlin87@gmail.com',
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=4),
}

#define the DAG
dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(minutes=20),
)

#define the task unzip data
unzip_data = BashOperator(
    task_id = 'unzip_data',
    bash_command = 'tar -zxvf /home/chili/airflow/dags/tolldata.tgz -C /home/chili/airflow/dags/tolldata',
	dag = dag,
)

#define the task extract data from csv file
extract_data_from_csv = BashOperator(
    task_id = "extract_data_from_csv",
    bash_command = 'cut -f1-4 -d"," /home/chili/airflow/dags/tolldata/vehicle-data.csv > /home/chili/airflow/dags/tolldata/csv_data.csv',
	dag = dag,
)

#define the task extract data from tsv file
extract_data_from_tsv = BashOperator(
    task_id = "extract_data_from_tsv",
    bash_command = 'cut -f5-7 /home/chili/airflow/dags/tolldata/tollplaza-data.tsv | tr "\t" "," | tr -d "\r" > /home/chili/airflow/dags/tolldata/tsv_data.csv',
	dag = dag,
)

#define the task extract data from fixed with file
extract_data_from_fixed_width = BashOperator(
    task_id = "extract_data_from_fixed_with",
    bash_command = "cut -c59-61,63-67 --output-delimiter=$',' /home/chili/airflow/dags/tolldata/payment-data.txt > /home/chili/airflow/dags/tolldata/fixed_width_data.csv",
	dag = dag,
)

#define the task consolidate data
consolidate_data = BashOperator(
    task_id = "consolidate_data",
    bash_command = "paste -d=',' /home/chili/airflow/dags/tolldata/csv_data.csv /home/chili/airflow/dags/tolldata/tsv_data.csv /home/chili/airflow/dags/tolldata/fixed_width_data.csv > /home/chili/airflow/dags/tolldata/extracted_data.csv",
	dag = dag,
)

#define the task transform the data
transform_data = BashOperator(
    task_id = "transform_data",
    bash_command = "awk -F\, '{$4=toupper($4)}1' OFS=\, /home/chili/airflow/dags/tolldata/extracted_data.csv > /home/chili/airflow/dags/tolldata/transformed_data.csv",
	dag = dag,
)

#transform_data = BashOperator(
#    task_id = "transform_data_extra",
#    bash_command = "tr a-z A-Z < extracted_data.csv > transformed_data.csv",
#	dag = dag,
#)

#define task pipeline
unzip_data >> extract_data_from_csv >> extract_data_from_tsv >> extract_data_from_fixed_width >> consolidate_data >> transform_data





