/* Write your T-SQL query statement below */
with cte as(
    select
        *,
        1.0 * rating / position as quality,
        case
            when rating >=3 then 0
            else 1
        end flag
from queries
)

select
    query_name,
    round(avg(quality), 2) as quality,
    round(avg(1.0 * flag) * 100, 2) as poor_query_percentage
from cte
group by query_name
