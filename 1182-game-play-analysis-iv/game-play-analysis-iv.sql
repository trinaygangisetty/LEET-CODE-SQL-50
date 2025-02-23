/* Write your T-SQL query statement below */
with intermediate_table as (
select
    *,
    row_number() over(partition by player_id order by event_date) as login_counts,
    lead(event_date) over(partition by player_id order by event_date) as next_login,
    case
        when datediff(day, event_date, lead(event_date) over(partition by player_id order by event_date)) = 1 then 1
        else null
    end log_player_count
from Activity
),
cte2 as (
select
    player_id
from intermediate_table
where login_counts = 1 and log_player_count = 1
)

select
    round( 1.0 * count(player_id) / (select count(distinct player_id) from activity), 2) as fraction
from cte2


