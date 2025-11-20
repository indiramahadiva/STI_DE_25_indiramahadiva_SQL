FROM
    food;

SELECT DISTINCT
    id
FROM
    food;

-- 201 distinct items
SELECT
    COUNT(DISTINCT id)
FROM
    food;

SELECT
    COUNT(*) AS number_rows
FROM
    food;

DESC food;

SELECT
    *
FROM
    food
WHERE
    week_id BETWEEN '20014-04' AND '2004-06'