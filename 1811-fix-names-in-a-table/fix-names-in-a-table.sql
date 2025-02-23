/* Write your T-SQL query statement below */
select
    user_id,
    upper(left(name, 1)) + lower(substring(name,2,len(name))) as name
from users
order by user_id