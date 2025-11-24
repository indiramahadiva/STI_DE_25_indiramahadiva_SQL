-- Task 2
-- 2 arguments are string and substring
SELECT
    title,
    context
FROM
    staging.sql_squad
WHERE
    regexp_matches (context, title);

SELECT
    title,
    context
FROM
    staging.sql_squad
WHERE
    NOT regexp_matches (context, title);

SELECT
    title,
    context,
    INSTR (context, title)
FROM
    staging.sql_squad
WHERE
    regexp_matches (context, title);

SELECT
    title,
    context,
    INSTR (context, title)
FROM
    staging.sql_squad
WHERE
    NOT regexp_matches (context, title);

-- TASK 3
-- show row if context start with title
-- Use LIKE operator with wildcard %
SELECT
    *
FROM
    staging.sql_squad
WHERE
    context LIKE 'Normans%'
    -- check result for Southern_Calfornia
    -- The results are not ok due to the wildcard _
SELECT
    *
FROM
    staging.sql_squad
WHERE
    context LIKE CONCAT (title, '%')
SELECT
    *
FROM
    staging.sql_squad
WHERE
    context LIKE CONCAT (title, '%')
    -- if you use regular expression function, underscore will be a literal character
SELECT
    *
FROM
    staging.sql_squad
WHERE
    regexp_matches (context, CONCAT ('^', title))
    -- Task 4
    -- Show a new column which is the first answer from the AI model
    
SELECT
    answers[18:], -- slicing
    answers[18], -- indexing
    answers
FROM
    staging.sql_squad;


SELECT
    answers[18:], 
    answers[18],
    CASE 
    WHEN answers[18] = ',' THEN NULL
    ELSE answers[18:]
END AS striped_answers,
answers
FROM
    staging.sql_squad;


SELECT
    answers[18:], 
    answers[18],
    CASE 
    WHEN answers[18] = ',' THEN NULL
    ELSE answers[18:]
END AS striped_answers,
INSTR(striped_answers, '''') AS first_quotation_index, -- a single quotation needs to be typed as ''
answers
FROM
    staging.sql_squad;


SELECT
    answers[18:], 
    answers[18],
    CASE 
    WHEN answers[18] = ',' THEN NULL
    ELSE answers[18:]
END AS striped_answers,
INSTR(striped_answers, '''') AS first_quotation_index,
striped_answers[:first_quotation_index-1] AS first_answers,
answers
FROM
    staging.sql_squad;

-- Task 5
SELECT 
    -- dont allow single quatation
    regexp_extract(answers, '''([^'']+)'',') AS first_answers,
    -- allows upper and lower case letters, digits, space, comma
    regexp_extract(answers, '''([A-Za-z0-9,]+)'',') AS first_answers,
    -- use the grouping optional argument in regexp_extract function 
    regexp_extract(answers, '''([A-Za-z0-9,]+)'',',1) AS first_answers,
answers
FROM staging.sql_squad;







