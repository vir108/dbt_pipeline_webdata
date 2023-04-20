{{ config(materialized='view') }}

with activitydetail_json_recommendation as
(
	SELECT 
        PageActivityId,
	    PageActivityType,
		PageActivityTS,  
		'Recommendation' as Category,
        cast(json_array_elements(Recommendation) -> 'ProductId' AS text) as ProductId,
		cast(json_array_elements(Recommendation) -> 'Size' AS text) as Size,
		cast(json_array_elements(Recommendation) -> 'Color' AS text) as Color,
        cast(json_array_elements(Recommendation) -> 'Brand' AS text) as Brand
   FROM {{ref('stg_pageactivitydetail_json_xform')}}
)

select * from activitydetail_json_recommendation
