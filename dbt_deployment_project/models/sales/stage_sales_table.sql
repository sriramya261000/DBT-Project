{{ config(materialized='table') }}

with base as (
    SELECT * FROM {{ ref('stage_sales') }}
)
SELECT 
    date,
    store_number,
    store_name,
    total_sales,
    total_bottles_sold,
    {{ give_discount('total_sales') }} as discount,
    Present_Date
FROM base