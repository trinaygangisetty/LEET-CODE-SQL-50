/* THIS IS MY SOLUTION */

select
id 
from(select 
    id,
    recordDate,
    temperature,
    LAG(recorddate) over(order by recorddate) as previousDate,
    LAG(temperature) over(order by recorddate) as previousDayTemp
from weather)t 
where (temperature > previousdaytemp) and (datediff(day,previousdate,recorddate) = 1)