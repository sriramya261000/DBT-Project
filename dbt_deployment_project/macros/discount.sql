{% macro give_discount(column_name) %}

    {{ column_name }} - {{column_name}} * 0.1 

{% endmacro %}