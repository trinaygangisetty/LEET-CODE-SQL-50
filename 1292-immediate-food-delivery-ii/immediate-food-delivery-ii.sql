/* Write your T-SQL query statement below */
with cte as (
    select
        rank() over(partition by customer_id order by order_date) as first_order,
        case
            when cast(order_date as date) = cast(customer_pref_delivery_date as date) then '1'
            else '0'
        end status
    from delivery
)

select
    round(avg(1.0 * status)* 100, 2) as immediate_percentage
from cte
where first_order = 1