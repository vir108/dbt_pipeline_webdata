
{% macro m_extract_checkpoint(dbname, schema_name, table_name, job_name) -%}

	{%- set extract_checkpoint -%}

	   SELECT cast(MAX(checkpoint_end) as text) as CHECKPOINT_START
	   FROM {{ dbname }}.{{ schema_name }}.{{ table_name }}
	   where job_name = '{{ job_name }}'
	{%- endset -%}

    {% set results = run_query(extract_checkpoint) %}
	
	{% if execute %}
		{# Return the first column #}
		{% set result_value = results.columns[0].values()[0] %}
	{% else %}
		{% set result_value = '1900-01-01 00:00:00' %}
	{% endif %}	

	{{ return(result_value) }}
{% endmacro -%}