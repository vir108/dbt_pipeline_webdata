
{{ config(materialized='table') }}

with activitydetail_json_recommendation as
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
		details.Brand        
   FROM {{ref('stg_activitydetail_recomm_json_xform')}} details
   JOIN {{ref('pageactivity')}} activity ON details.PageActivityId = activity.ActivityId
)

select * from activitydetail_json_recommendation

