/* Write your T-SQL query statement below */
with cte as (
    select
        turn,
        person_id as id,
        person_name as name,
        weight,
        sum(weight) over(order by turn rows between unbounded preceding and current row) as total_weight,
        case 
            when sum(weight) over(order by turn rows between unbounded preceding and current row) <= 1000 then 1
            else 0
        end eligible
    from queue
),
cte2 AS(
    select
        *,
        last_value(name) over(order by turn rows between unbounded preceding and unbounded following) as last_person
    from cte
    where eligible = 1
)
select 
    distinct last_person as person_name
from cte2
