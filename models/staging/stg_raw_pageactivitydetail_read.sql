
{{ config(materialized='view') }}

with source_data as 
(
    select * from {{ source ("RAW_PAGEACTIVITY","PageActivityDetail_raw_data") }}  
    where "PageActivityTS" > '{{ m_extract_checkpoint('pgwebdata', 'dev', 'web_activity_checkpoint', 'Web_Activity_Browse') }}'
)

select * from source_data