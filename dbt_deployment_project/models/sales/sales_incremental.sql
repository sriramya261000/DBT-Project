
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='incremental',
            unique_key='invoice_and_item_number',
            incremental_strategy='merge') 
}}

WITH
  base AS (
  SELECT * FROM `essential-cairn-380706.liquor_sales.sales` 
)
SELECT
  invoice_and_item_number,
  date,
  store_number,
  store_name,
  item_number,
  item_description,
  pack,
  bottles_sold,
  sale_dollars,
  current_date('Asia/Kolkata') as Present_Date
FROM
  base

