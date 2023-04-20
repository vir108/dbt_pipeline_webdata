
{{ config(materialized='view') }}

with activitydetail_json_results as
(
	SELECT
        PageActivityId,
	    PageActivityType,
		PageActivityTS, 
        'Result' as Category,
        cast(json_array_elements(Results) -> 'ProductId' AS text) as ProductId,
		cast(json_array_elements(Results) -> 'Size' AS text) as Size,
		cast(json_array_elements(Results) -> 'Color' AS text) as Color		 
   FROM {{ref('stg_pageactivitydetail_json_xform')}}    
)

select * from activitydetail_json_results

		