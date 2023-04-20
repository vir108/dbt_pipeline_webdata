{{ config(materialized='view') }}

with activitydetail_read as
(
  select 
      "PageActivityId"      as PageActivityId, 
      "PageActivityType"    as PageActivityType,
      "PageActivityTS"      as PageActivityTS,
      "ActivityDetail_JSON" as ActivityDetail_JSON
  from {{ ref('stg_raw_pageactivitydetail_read') }}
  where "PageActivityType" is not null
),

activitydetail_json as 
(
	SELECT PageActivityId,PageActivityType,PageActivityTS, 
		cast(trim(both '"' from ActivityDetail_JSON) AS json) -> 'ActivityDetail' -> 'Results' as Results,
		cast(trim(both '"' from ActivityDetail_JSON) AS json) -> 'ActivityDetail' -> 'Recommendation' as Recommendation,
		cast(trim(both '"' from ActivityDetail_JSON) AS json) -> 'ActivityDetail' -> 'Promotion' as Promotion
	from activitydetail_read
)

select * from activitydetail_json