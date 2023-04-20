-- Use the `ref` function to select from other models
{{ config(materialized='view') }}

select 
  "PageActivityId"          as ActivityId,
  "PageActivityType"        as ActivityType,
  "PageActivityTS"          as ActivityTS,
  "PageActivityUserSession" as ActivityUserName,
  "UserDevice"              as ActivityUserDevice
from {{ ref('stg_raw_pageactivity_read') }}
where "PageActivityType" is not null
