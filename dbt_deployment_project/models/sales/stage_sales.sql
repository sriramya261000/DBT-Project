{{ config(materialized='ephemeral') }}

with base as (
    SELECT * FROM `essential-cairn-380706.liquor_sales.sales` 
),
base2 as (
    SELECT 
    date,
    store_number,
    store_name,
    {{ total('bottles_sold') }} as total_bottles_sold,
    {{ total('sale_dollars') }} as total_sales,
     current_date('Asia/Kolkata') as Present_Date

    FROM base
    group by date, store_number, store_name, Present_Date
    order by date
)

SELECT 
    date, 
    store_name, 
    store_number, 
    total_bottles_sold,
    total_sales,
    Present_Date
FROM base2