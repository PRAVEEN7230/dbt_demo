select
"height",
listagg("known_for_movies", ',') as "temp"
from "names" 
group by "height"

select
"name",
listagg("known_for_movies", ',') as "known_for_movies"
from "names" 
group by "name"

select * from "names"