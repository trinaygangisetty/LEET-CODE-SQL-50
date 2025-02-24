/* Write your T-SQL query statement below */
select
    employee_id
from employees
where salary < 30000 and manager_id NOT IN (select distinct employee_id from employees)
order by employee_id