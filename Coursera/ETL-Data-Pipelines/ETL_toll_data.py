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
    'retry_delay': timedelta(minutes=5),
}

#define the DAG
dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(days=1),
)

#define the task unzip data
unzip_data = BashOperator(
    task_id = 'unzip data',
    bash_command = 'sudo tar -zxvf tolldata.tgz',
)

#define the task extract data from csv file
extract_data_from_csv = BashOperator(
    task_id = "extract data from csv",
    bash_command = 'cut -f1-4 -d"," vehicle-data.csv > csv_data.csv',
)

#define the task extract data from tsv file
extract_data_from_tsv = BashOperator(
    task_id = "extract data from tsv",
    bash_command = "cut -f5-7 -d$'\t' --output-delimiter=$',' tollplaza-data.tsv > tsv_data.csv",
)

#define the task extract data from fixed with file
extract_data_from_fixed_width = BashOperator(
    task_id = "extract data from fixed with",
    bash_command = "cut -c59-61,63-67 --output-delimiter=$',' payment-data.txt > fixed_width_data.csv",
)





