/* Write your T-SQL query statement below */

select
    product_name,
    sum(unit) as unit
from products p
inner join orders o
on p.product_id = o.product_id
where format(order_date,'yyyy-MM') = '2020-02'
group by product_name
having sum(unit) >= 100