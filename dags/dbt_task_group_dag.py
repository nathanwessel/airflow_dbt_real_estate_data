"""
### Run a dbt Core project as a task group with Cosmos

Simple DAG showing how to run a dbt project as a task group, using
an Airflow connection and injecting a variable into the dbt project.
"""

from airflow.decorators import dag
from cosmos.providers.dbt.task_group import DbtTaskGroup
from pendulum import datetime

CONNECTION_ID = "db_conn"
# !! this might need to change to raw
DB_NAME = "analytics"
# !! this might need to change to realty_mole_property_api
SCHEMA_NAME = "dbt_ndw"
# ! find this in the dbt_project.yml
DBT_PROJECT_NAME = "real_estate_dbt_project"
# the path where Cosmos will find the dbt executable
# in the virtual environment created in the Dockerfile
DBT_EXECUTABLE_PATH = "/usr/local/airflow/dbt_venv/bin/dbt"
# ! this looks suspicious
# The path to your dbt root directory
# DBT_ROOT_PATH = "/usr/local/airflow/dags/dbt"
DBT_ROOT_PATH = "/usr/local/airflow/dags/real_estate_data_dbt_project"


@dag(
    start_date=datetime(2023, 6, 1),
    schedule=None,
    catchup=False,
)
def dbt_task_group_dag():
    DbtTaskGroup(
        group_id="transform_data",
        dbt_project_name=DBT_PROJECT_NAME,
        conn_id=CONNECTION_ID,
        dbt_root_path=DBT_ROOT_PATH,
        dbt_args={
            "dbt_executable_path": DBT_EXECUTABLE_PATH,
            "schema": SCHEMA_NAME,
            "vars": '{"my_name": "Astro", "SNOWFLAKE_DATABASE":"analytics"}',
        },
    )


dbt_task_group_dag()