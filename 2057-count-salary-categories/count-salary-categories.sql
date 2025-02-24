/* Write your T-SQL query statement below */
with categories as(
    select 'High Salary' as category
    union
    select 'Average Salary' 
    union
    select 'Low Salary'
),
logic as (
    select
    account_id,
    income,
    case 
        when income <20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary'
    end category
from accounts
)
select
    c.category,
    coalesce(count(l.account_id), 0) as accounts_count
from categories c
left join logic l
on c.category = l.category
group by c.category
