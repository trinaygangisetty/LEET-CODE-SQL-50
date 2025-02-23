/* Write your T-SQL query statement below */
select
    max(salary) as SecondHighestSalary
from(
    select
        salary,
        dense_rank() over(order by salary desc) as ordering
    from employee
)t
where ordering = 2
