--Using logical operator
ELECT job_title,
experience_level,
ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_month
FROM
    data_jobs
WHERE
    (salary_sek_month > 200000)
    AND (salary_sek_month < 300000)
ORDER BY
    salary_sek_month DESC;

-- Using comparison Operator
SELECT
    job_title,
    experience_level,
    ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_month
FROM
    data_jobs
WHERE
    salary_sek_month BETWEEN 200000 AND 300000
ORDER BY
    salary_sek_month DESC;

-- OR Operator
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    experience_level = 'Senior Level'
    or experience_level = 'Expert Level';

-- NOT Operator
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    NOT (
        experience_level = 'Senior Level'
        or experience_level = 'Expert Level'
    );