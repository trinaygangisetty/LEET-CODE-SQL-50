/* Write your T-SQL query statement below */
DELETE FROM person
where id not in (
    select
        id
    from(
        select
            id,
            row_number() over(partition by email order by id) numbering
        from person
        )t
    where numbering = 1
)

