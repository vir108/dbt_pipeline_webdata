{% macro run_vacuum(table) %}

  {% set query %}
    vacuum table {{ table }}
  {% endset %}

  {% do run_query(query) %}
{% endmacro %}