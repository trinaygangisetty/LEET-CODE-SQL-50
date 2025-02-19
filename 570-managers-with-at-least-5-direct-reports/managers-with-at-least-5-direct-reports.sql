/* Write your T-SQL query statement below */
select
name
from
(
    SELECT
        NAME,
        count(id) as counting
    FROM(
        SELECT
            E1.NAME,
            E1.ID
        FROM EMPLOYEE E1
        JOIN EMPLOYEE E2
        ON E1.ID = E2.MANAGERID
        )t
    group by id, name
    )Y
WHERE COUNTING >= 5


