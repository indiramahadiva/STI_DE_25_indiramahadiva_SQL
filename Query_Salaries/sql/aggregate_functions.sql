SELECT
    MIN(salary_in_USD) AS min_salary_usd,
    ROUND(AVG(salary_in_USD)) AS avg_salary_usd,
    MEDIAN (salary_in_USD) AS median_salary_usd,
    MAX(salary_in_USD) AS max_salary_usd,
FROM
    data_jobs;