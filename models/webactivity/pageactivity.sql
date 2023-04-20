{{ config(materialized='table') }}

select 
  ActivityId,
  ActivityType,
  ActivityTS,
  ActivityUserName,
  ActivityUserDevice
from {{ ref('stg_pageactivity_xform') }}
