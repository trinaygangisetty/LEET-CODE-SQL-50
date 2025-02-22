/* Write your T-SQL query statement below */
select
    *,
    CASE 
        WHEN x + y > z and x + z > y and y + z > x then 'Yes'
        Else 'No'
    end as triangle
from triangle