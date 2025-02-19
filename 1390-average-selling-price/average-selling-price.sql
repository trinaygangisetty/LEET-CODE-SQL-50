with cte as (
    select
        p.product_id as product_id,
        isnull(u.units,0) as units,
        P.PRICE * isnull(U.UNITS,0) AS COST
    FROM PRICES P
    LEFT JOIN UNITSSOLD U
    ON P.PRODUCT_ID = U.PRODUCT_ID 
    WHERE U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE or u.purchase_date is null
)

select 
    product_id,
    case
        when sum(cost) = 0 and sum(units) = 0 then 0
        else round(sum(cast(cost as float)) / sum(units),2)
    end as average_price
from cte
group by product_id