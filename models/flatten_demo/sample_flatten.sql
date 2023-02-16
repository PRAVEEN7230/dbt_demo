-- select
-- 	value:location:state_city::String as state_city,
--     value:location:zip::Number as zip,
--     value:price::Number as price,
--     value:sale_date::Date as sale_date
-- from 
-- 	json_raw ,
-- 	lateral flatten( input => data );

select * 
from json_raw jr,
lateral flatten(input => jr.data);

select f.seq, f.key, f.path, f.value
from json_raw jr,
lateral flatten(input => jr.data:products, recursive => true) f;


with low_level_flatten as (
	select f.key as json_key, f.path as json_path, 
	f.value as json_value
	from json_raw, 
	lateral flatten(input => data:products, recursive => true ) f
)

select distinct json_path
from low_level_flatten
where not contains(json_value, '{')

{{
  generate_flatten_json(
    model_name = ref('json_data_model'),
    json_column = 'data:products'
  )
}}
