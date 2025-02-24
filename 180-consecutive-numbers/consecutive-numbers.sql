/* Write your T-SQL query statement below */
with cte as(
    select
        id,
        lag(num) over(order by id) as previous_num,
        num,
        lead(num) over(order by id) as next_num
    from logs
)
select
    distinct num as ConsecutiveNums
from cte
where previous_num = num and num = next_num


