/* Write your T-SQL query statement below */
select 
    employee_id,
    department_id
from(
    select 
        employee_id, 
        department_id,
        count(employee_id) over(partition by employee_id order by employee_id) as counting
    from employee

)t
where counting = 1

UNION

select
    employee_id,
    department_id
from employee
where primary_flag = 'Y'

