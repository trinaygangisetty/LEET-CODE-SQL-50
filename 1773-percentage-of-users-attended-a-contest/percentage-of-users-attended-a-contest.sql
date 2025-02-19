/* Write your T-SQL query statement below */
with cte as (
   select 
        contest_id,
        count(contest_id) as counting
    from register 
    group by contest_id
),
cte1 as (
    select 
        count(user_id) as total_users
    from users
)

select 
    c1.contest_id,
    round((1.0 * c1.counting) / (c2.total_users) * 100, 2)as percentage
from cte c1, cte1 c2
order by percentage desc, contest_id asc

