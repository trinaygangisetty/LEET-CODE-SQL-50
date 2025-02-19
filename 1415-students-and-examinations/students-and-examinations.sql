/* Write your T-SQL query statement below */
WITH CTE AS (
    select
s.student_id as student_id,
s.student_name as student_name,
b.subject_name as subject_name,
count(e.subject_name) over(partition by s.student_id, s.student_name, b.subject_name) as attended_exams
from students s
cross join subjects b
full outer join examinations e
on s.student_id = e.student_id and b.subject_name = e.subject_name
)

SELECT DISTINCT student_id,
student_name,
subject_name,
attended_exams
FROM CTE
ORDER BY STUDENT_ID, SUBJECT_NAME