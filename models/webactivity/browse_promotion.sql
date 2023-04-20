{{ config(materialized='table') }}

with activitydetail_json_Promotion as
(
	SELECT 
        activity.ActivityId,
	    activity.ActivityType,
		activity.ActivityTS, 
	    activity.activityusername,
		activity.activityuserdevice,
		details.Category,
		details.ProductId,
		details.Size,
		details.Color,
		details.Brand,   
        details.RegPrice,
		details.DiscoPrice,
		details.PromoDisco
   FROM {{ref('stg_activitydetail_promo_json_xform')}} details
   JOIN {{ref('pageactivity')}} activity ON details.PageActivityId = activity.ActivityId
)

select * from activitydetail_json_Promotion

	