/* Write your T-SQL query statement below */
select
    sell_date,
    count(sell_date) as num_sold,
    string_agg(product,',') as products
from(
    select
        distinct
        sell_date,
        product,
        count(sell_date) over(partition by sell_date order by product) as counting
    from activities
)t
group by sell_date


