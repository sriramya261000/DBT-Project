{{config(materialized='view') }}

SELECT
    category_name AS category_name,
    item_description,
     current_date('Asia/Kolkata') as Present_Date,
    COUNT(*) AS sales_count
FROM `essential-cairn-380706.liquor_sales.sales` 
GROUP BY
    1,2,3
ORDER BY
    4 DESC
LIMIT 10