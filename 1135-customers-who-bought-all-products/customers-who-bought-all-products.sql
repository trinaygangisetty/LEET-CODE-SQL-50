/* Write your T-SQL query statement below */
WITH Distinct_rows as (
    SELECT
        DISTINCT CUSTOMER_ID, PRODUCT_KEY
    FROM CUSTOMER
)

select
distinct customer_id
from(
    select
        p.product_key,
        customer_id,
        count(customer_id) over(partition by customer_id) as counting
    from product p
    inner join distinct_rows d
    on p.product_key = d.product_key
)t
where counting = (select count(distinct product_key) from product)
