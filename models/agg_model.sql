
{{ config(materialized='table', transient=false) }}

with source_data as (
    select
    "name",
    "known_for_movies"
    from "names_fin"
)

select * from source_data