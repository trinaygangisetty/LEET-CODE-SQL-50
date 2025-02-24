/* Write your T-SQL query statement below */
with cte as(
    select
        visited_on,
        sum(amount) as amount
    from customer
    group by visited_on
),
cte2 as(
    select
        visited_on,
        count(visited_on) over(order by visited_on
                            rows between 6 preceding and current row) as counting,
        sum(amount) over(order by visited_on
                        rows between 6 preceding and current row) as amount,
        avg(1.0 * amount) over(order by visited_on
                        rows between 6 preceding and current row) as average_amount
    from cte
)
select
    visited_on,
    amount,
    round(average_amount,2) as average_amount
from cte2
where counting = 7