/* Write your T-SQL query statement below */
select
    product_id,
    year as first_year,
    quantity,
    price
from(
    select
        *,
        dense_rank() OVER(PARTITION BY PRODUCT_ID ORDER BY YEAR) AS NUMBER
    from sales
)t
where number = 1
order by product_id

