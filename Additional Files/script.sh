#!/bin/sh
echo "Script Execution starts"

cd dbt_deployment_project
dbt debug --profiles-dir .
dbt seed --profiles-dir .
dbt run --profiles-dir .
dbt test --profiles-dir .

echo "Script Execution Ends"
echo "------------DONE-------------"

