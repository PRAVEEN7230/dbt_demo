{{ config(materialized='table', transient=false) }}

with source_data as (
   select data from json_raw
)

select * from source_data