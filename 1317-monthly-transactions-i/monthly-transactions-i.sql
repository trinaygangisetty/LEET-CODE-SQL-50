with intermediate_table as (
select
    format(trans_date,'yyyy-MM') as month,
    country,
    count(id) over(partition by country, format(trans_date,'yyyy-MM')) as trans_count,
    case
        when state = 'approved' then 1
        else 0
    end is_approved,
    sum(amount) over(partition by country, format(trans_date,'yyyy-MM')) as trans_total_amount,
    case
        when state = 'approved' then amount
        else 0
    end as approved_amount
from transactions    
)
select
    month,
    country,
    trans_count,
    sum(is_approved) as approved_count,
    trans_total_amount,
    sum(approved_amount) as approved_total_amount
from intermediate_table
group by month, country,trans_count,trans_total_amount
order by month


