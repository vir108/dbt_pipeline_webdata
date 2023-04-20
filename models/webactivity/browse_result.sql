
{##  {{ config(materialized='incremental'), incremental_strategy = 'delete+insert' }}  ##}

{{ config(materialized='table') }}

with activitydetail_json_results as
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
		details.Color        
   FROM {{ref('stg_activitydetail_result_json_xform')}} details
   JOIN {{ref('pageactivity')}} activity ON details.PageActivityId = activity.ActivityId
)

select * from activitydetail_json_results

		