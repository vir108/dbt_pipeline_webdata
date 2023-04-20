
{{ config(materialized='view') }}

with source_data as 
(
    select * from {{ source ("RAW_PAGEACTIVITY","PageActivity_raw_data") }}
)

select * from source_data