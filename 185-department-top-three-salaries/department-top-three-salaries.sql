/* Write your T-SQL query statement below */
with cte as(
    select
        d.name as department,
        e.name as employee,
        salary,
        dense_rank() over(partition by departmentid order by salary desc) as ranking
    from employee e
    left join department d
    on e.departmentid = d.id
)
select 
    department,
    employee,
    salary
from cte
where ranking <= 3