{% macro total(column_name) %}
    sum({{ column_name }})
{% endmacro %}