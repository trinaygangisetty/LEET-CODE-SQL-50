with movie as (
    select    
        m.title as results,
        avg(1.0 * rating) over(partition by m.title order by m.title) as rating
    from movies m
    left join movierating r
    on m.movie_id = r.movie_id
    where format(r.created_at, 'yyyy-MM') = '2020-02'
),
movie_first_row as(
select 
    *,
    row_number() over(order by rating desc, results asc) as row_num
from movie
),
user_cte as(
    select
        u.name as results,
        count(u.user_id) over(partition by u.name order by u.name) as counting
    from users u
    left join movierating r
    on u.user_id = r.user_id
),
user_first_row as(
select
    *, 
    row_number() over(order by counting desc, results asc) as row_num
from user_cte   
)

select 
results
from user_first_row
where row_num = 1

union all

select 
results
from movie_first_row
where row_num = 1