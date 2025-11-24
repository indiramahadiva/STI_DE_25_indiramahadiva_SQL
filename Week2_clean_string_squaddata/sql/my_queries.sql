FROM
    staging.sql_squad;

SELECT
    *
FROM
    staging.sql_squad
WHERE
    title IS NULL
SELECt
    *
FROM
    staging.sql_squad
WHERE
    title = NULL
    -- Find rows that do not contain the title column value in the context column value
SELECT
    *
FROM
    staging.sql_squad
WHERE
    staging.sql_squad.context NOT LIKE '%' || staging.sql_squad.title || '%';

SELECT
    title,
    lower(trim(context)) as cleaned_context
FROM
    staging.sql_squad
WHERE
    context LIKE 'Normans%';

SELECT
    *
FROM
    staging.sql_squad
WHERE
    staging.sql_squad.context LIKE staging.sql_squad.title || '%';