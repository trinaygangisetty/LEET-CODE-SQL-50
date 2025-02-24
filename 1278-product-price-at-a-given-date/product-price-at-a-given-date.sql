/* Write your T-SQL query statement below */
select 
    product_id,
    new_price as price 
from(
    select
        *,
        ROW_NUMBER() OVER(PARTITION BY PRODUCT_ID ORDER BY CHANGE_DATE DESC) AS LATEST_DATE
    from products
    where change_date <= '2019-08-16'
)t
where latest_date = 1

union

select 
    product_id,
    10 as price
from(
    select
        *,
        min(change_date) over(partition by product_id order by change_date) as mindate
    from products
)t
where mindate > '2019-08-16'