-- do select first to see that we get as we want
-- change the experience_level labels
SELECT
    CASE
        WHEN experience_level = 'SE' THEN 'Senior Level'
        WHEN experience_level = 'MI' THEN 'Mid Level'
        WHEN experience_level = 'EN' THEN 'Entry Level'
        WHEN experience_level = 'EX' THEN 'Expert Level'
    END AS experience_level,
    * EXCLUDE (experience_level)
FROM
    data_jobs;

-- to persist changes
UPDATE data_jobs
SET
    experience_level = CASE
        WHEN experience_level = 'SE' THEN 'Senior Level'
        WHEN experience_level = 'MI' THEN 'Mid Level'
        WHEN experience_level = 'EN' THEN 'Entry Level'
        WHEN experience_level = 'EX' THEN 'Expert Level'
    END;

SELECT DISTINCT
    experience_level
FROM
    data_jobs;