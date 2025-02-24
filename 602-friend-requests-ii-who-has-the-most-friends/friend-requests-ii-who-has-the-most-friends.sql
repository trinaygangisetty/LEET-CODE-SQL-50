/* Write your T-SQL query statement below */
with cte as(
    select 
        requester_id as rid,
        count(requester_id) as r_count
    from RequestAccepted
    group by requester_id

    union all

    select 
        accepter_id as aid,
        count(accepter_id) as a_count
    from RequestAccepted
    group by accepter_id
)
select top 1
    rid as id,
    sum(r_count) as num
from cte
group by rid
order by sum(r_count) desc