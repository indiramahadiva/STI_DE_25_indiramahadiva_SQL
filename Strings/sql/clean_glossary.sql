SELECT
    UPPER(TRIM(sql_word)) AS sql_word,
    regexp_replace (trim(description), ' +', ' ', 'g') as descripyion,
    example
FROM
    staging.sql_glossary;

CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE
IF NOT EXISTS refined.sql_glossary AS(
    SELECT
    UPPER(TRIM(sql_word)) AS sql_word,
    regexp_replace (trim(description), ' +', ' ', 'g') as descripyion,
    example
FROM
    staging.sql_glossary;
)
