{% macro sales_percentage(column1, colum2) %}
    {{column1}} * 100 / {{column2}}
{% endmacro %}