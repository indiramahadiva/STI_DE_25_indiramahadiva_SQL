SELECT
rating,
COUNT(\*) AS number_film
FROM sakila.film
GROUP BY rating
