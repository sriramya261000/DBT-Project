{% test invoice_number(model, column_name) %}
    SELECT {{column_name}}
    FROM {{model}}
    WHERE {{column_name}} NOT LIKE '%INV-%'
{% endtest %}