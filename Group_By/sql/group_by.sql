SELECT
    food,
    SUM(number_of_seraches) AS total_searches
FROM
    cleaned_food
GROUP BY
    food
ORDER BY
    total_searches DESC
LIMIT
    10;

-- total searches by year
SELECT
    year,
    SUM(number_of_seraches) AS total_searches
FROM
    cleaned_food
GROUP BY
    year
ORDER BY
    total_searches

-- filter by total search > 300k
SELECT
    year,
    SUM(number_of_seraches) AS total_searches
FROM
    cleaned_food
GROUP BY
    year
HAVING
    total_searches > 300_000
ORDER BY
    year;

-- group by 2 cols
SELECT
    year,
    food,
    SUM(number_of_seraches) AS total_searches
FROM
    cleaned_food
GROUP BY
    food,
    year
HAVING 
    food IN ('pizza', 'sushi')
ORDER BY food, year;