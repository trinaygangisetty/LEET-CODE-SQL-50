/* Write your T-SQL query statement below */
select 
    patient_id,
    patient_name,
    conditions
from(
select
    *,
    CASE
        WHEN conditions like 'DIAB1%' then 1
        WHEN conditions like '% DIAB1%' then 1
        else 0
    end is_diabetic
from patients
)t
where is_diabetic = 1
