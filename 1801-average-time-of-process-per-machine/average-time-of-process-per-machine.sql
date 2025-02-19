/* Write your T-SQL query statement below */
select 
machine_id, 
round(avg(abs(end_time - timestamp)),3) as processing_time
from (
    select
        *,
        case 
             when activity_type = 'start' then 0
             else 1
             end flag,
        lead(timestamp) over(partition by machine_id,process_id order by machine_id asc, process_id asc, activity_type desc) end_time
    from activity)t
where flag = 0
group by machine_ID

