/* Write your T-SQL query statement below */
select
    max(num) as num
from(
    select
        num,
        count(num) over(partition by num order by num) as count
    from mynumbers
)t
where count=1
