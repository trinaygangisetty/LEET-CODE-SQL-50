/* Write your T-SQL query statement below */
select
    sell_date,
    count(sell_date) as num_sold,
    string_agg(product,',') within group (order by product) as products
from(
    select
        distinct
        sell_date,
        product
    from activities
)t
group by sell_date


