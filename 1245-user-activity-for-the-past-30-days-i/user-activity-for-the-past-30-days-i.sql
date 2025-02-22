SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users 
FROM activity
GROUP BY activity_date
HAVING activity_date > '2019-06-27' and activity_date <= '2019-07-27';