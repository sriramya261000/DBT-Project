# dbt_deployment

This project aims to develop SQL models in DBT and schedule these models in platforms like Apache Airflow (Google Cloud Composer), Dbt Cloud, and Google Cloud Run. The project aimed to explore and leverage the full range of data operations available for DBT workflows.

# Solution Architecture

![dbt](https://github.com/Aravind-DEV83/dbt_deployment/assets/129648011/7961df91-c9cf-4c60-9ef0-c28bf3897fcc)


1. Users write dbt code in their text editor of choice and then invoke dbt from the command line. 
2. Upload the Dbt project and Airflow DAG from the Local system to the dags folder in the GCS bucket created by the composer environment.
3. The Airflow DAG will run on a scheduled basis and write results to Snowflake.
4. Push the dbt project to the GitHub repo and integrate with the dbt cloud and schedule jobs in dbt which will write results to BigQuery.
5. Every time code is pushed to the GitHub master branch, the cloud build will trigger and create a new docker image push to the container registry and then a cloud run service will be deployed with the latest image. 
6. The cloud scheduler will trigger the cloud run URL at the scheduled time and write the results to bigquery.
