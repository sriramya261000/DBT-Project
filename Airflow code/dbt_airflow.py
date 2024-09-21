from airflow import DAG, configuration
from airflow_dbt.operators.dbt_operator import DbtRunOperator, DbtTestOperator, DbtSeedOperator
from datetime import timedelta, datetime

PROJECT_ID = 'essential-cairn-380706'
DBT_FOLDER = 'dbt_deployment_project'
DAGS_FOLDER = '/home/airflow/gcs/dags'

default_args = {
    'dir': f'{DAGS_FOLDER}/{DBT_FOLDER}',
    'profiles_dir': f'{DAGS_FOLDER}/{DBT_FOLDER}',
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 4, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
    'project_id': PROJECT_ID
}

with DAG(dag_id='dbt_deployment', default_args=default_args, schedule_interval='@daily') as dag:
    
    dbt_test_operator = DbtTestOperator(
        task_id='dbt_test_operator',
        retries=0,
    )
    
    dbt_run_operator = DbtRunOperator(
        task_id='dbt_run_operator',
    )

    dbt_seed_operator = DbtSeedOperator(
        task_id='dbt_seed_operator',
    )


dbt_test_operator >> dbt_run_operator >> dbt_seed_operator
