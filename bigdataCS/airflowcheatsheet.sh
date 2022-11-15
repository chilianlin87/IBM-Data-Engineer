
export AIRFLOW_HOME=~/airflow
airflow standalone #start airflow
airflow dags list #list all dags
airflow tasks list example_bash_operator #list tasks in a dag
airflow dags unpause tutorial #unpause a dag
airflow dags pause tutorial #pause a dag
(sudo) cp my_first_dag.py $AIRFLOW_HOME/dags #submit the dag, copy python file to dags filder

