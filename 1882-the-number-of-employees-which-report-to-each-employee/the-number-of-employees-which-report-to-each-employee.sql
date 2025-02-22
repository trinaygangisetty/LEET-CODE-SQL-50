/* Write your T-SQL query statement below */
with reporting_managers as(
    select
        e1.employee_id as employee_id,
        e1.name,
        e2.name as employee_name,
        e2.age
    from employees e1
    join employees e2
    on e1.employee_id = e2.reports_to
)
select 
    employee_id,
    name,
    count(employee_name) as reports_count,
    round(avg(1.0 * age),0) as average_age
from reporting_managers
group by employee_id, name
order by employee_id