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
    'retry_delay': timedelta(minutes=2),
}

#define the DAG
dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(minutes=2),
)

#define the task unzip data
unzip_data = BashOperator(
    task_id = 'unzip_data',
    bash_command = 'tar -zxvf ~/airflow/ETLfinal/tolldata.tgz',
    dag = dag,
)

#define the task extract data from csv file
extract_data_from_csv = BashOperator(
    task_id = "extract_data_from_csv",
    bash_command = 'cut -f1-4 -d"," ~/airflow/ETLfinal/vehicle-data.csv > ~/airflow/ETLfinal/csv_data.csv',
    dag = dag,
)

#define the task extract data from tsv file
extract_data_from_tsv = BashOperator(
    task_id = "extract_data_from_tsv",
    bash_command = 'cut -f5,6,7 ~/airflow/ETLfinal/tollplaza-data.tsv | tr -d "\r" |  tr "[:blank:]" "," > ~/airflow/ETLfinal/tsv_data.csv ',
    dag = dag,
)

#define the task extract data from fixed with file
extract_data_from_fixed_width = BashOperator(
    task_id = "extract_data_from_fixed_with",
    bash_command = "cut -c59-61,63-67 --output-delimiter=$',' ~/airflow/ETLfinal/payment-data.txt > ~/airflow/ETLfinal/fixed_width_data.csv",
    dag = dag,
)

#define the task consolidate
consolidate_data = BashOperator(
    task_id = "consolidate_data",
    bash_command = "paste -d , ~/airflow/ETLfinal/csv_data.csv ~/airflow/ETLfinal/tsv_data.csv ~/airflow/ETLfinal/fixed_width_data.csv > ~/airflow/ETLfinal/extracted_data.csv",
    dag = dag,
)

#define the task transform data
transform_data = BashOperator(
    task_id = "transform_data",
    bash_command = "awk -F\, '{$4=toupper($4)}1' OFS=\, ~/airflow/ETLfinal/extracted_data.csv > ~/airflow/ETLfinal/transformed_data.csv",
    dag = dag,
)

#define task pipeline
unzip_data >> extract_data_from_csv >> extract_data_from_tsv >> extract_data_from_fixed_width >> consolidate_data >> transform_data





