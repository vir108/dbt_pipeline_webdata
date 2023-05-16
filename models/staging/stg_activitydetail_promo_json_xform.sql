{{ config(materialized='view') }}

with activitydetail_json_Promotion as
(
	SELECT 
        PageActivityId,
	    PageActivityType,
		PageActivityTS, 
        'Promotion' as Category,
        cast(json_array_elements(Promotion) -> 'ProductId' AS text) as ProductId,
		cast(json_array_elements(Promotion) -> 'Size' AS text) as Size,
		cast(json_array_elements(Promotion) -> 'Color' AS text) as Color,
        cast(json_array_elements(Promotion) -> 'Brand' AS text) as Brand,
        cast(json_array_elements(Promotion) -> 'RegularPrice' AS text) as RegPrice,
		cast(json_array_elements(Promotion) -> 'DiscountPrice' AS text) as DiscoPrice,
		cast(json_array_elements(Promotion) -> 'PromoDicount' AS text) as PromoDisco
   FROM {{ref('stg_pageactivitydetail_json_xform')}}   
)

select * from activitydetail_json_Promotion

	