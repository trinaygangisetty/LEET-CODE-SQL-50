/* Write your T-SQL query statement below */
WITH cte as(
   select
    s.user_id as id, 
    case 
        when action = 'confirmed' then 1
        else 0
    end flag
    from
    signups s
    left join confirmations c
    on s.user_id = c.user_id
)

select
id as user_id,
round(avg(cast(flag as float)),2) as confirmation_rate
from cte
group by id