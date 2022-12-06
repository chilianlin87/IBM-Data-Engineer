

# import the libraries

from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

#defining DAG arguments

# You can override them on a per-task basis during operator initialization
default_args = {
    'owner': 'Lenny Chi',
    'start_date': days_ago(0),
    'email': ['chi.lianlin87@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# defining the DAG
dag = DAG(
    'simple_dag',
    default_args=default_args,
    description='My simple DAG',
    schedule_interval=timedelta(minutes=3),
)

# define the tasks

# define the first task

task1 = BashOperator(
    task_id='task1',
    bash_command='echo task 1 >> /home/chili/airflow/dags/simple1.txt',
    dag=dag,
)


# define the second task
task2 = BashOperator(
    task_id='task2',
    bash_command='echo task 2 >> /home/chili/airflow/dags/simple2.txt',
    dag=dag,
)

# define the third task
task3 = BashOperator(
    task_id='task3',
    bash_command='echo task 3 >> /home/chili/airflow/dags/simple3.txt',
    dag=dag,
)

# task pipeline
task1 >> task2 >> task3
