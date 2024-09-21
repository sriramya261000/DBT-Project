{{ config(materialized='view') }}

select * from {{ ref('stage_sales') }}