/* TASK 2 */ - Find the data types of columns DESC staging.weather;

DESC
SELECT
    sunriseTime,
    sunriseTime,
    temperatureHighTime,
    temperatureLowTime,
    windGustTime,
    precipIntensityMaxTime
FROM
    staging.weather;

-- show the UNIX values of these columns
-- the values are the numbers of seconds counted from a refrence
-- time point (1970-01-01 00:00:00)
-----------------------------------------------------------------------------------------
/* TASK 3 */
-- each row in the dataset contains weather data for each combination of Country/Religion,
-- Province/State and date (time column)
-- it's importan to understand which column to be used to uniquely identify each row
-- use aggregation function together with group by
SELECT
    "Country/Region" AS Country,
    "Province/State" AS State,
    COUNT(*) AS Nr_Records,
FROM
    staging.weather
GROUP BY
    Country,
    State
ORDER BY
    Country,
    State;

---------------------------------------------------------------------------
/* TASK 4 */
SELECT
    to_timestamp (sunriseTime) AS sunrise_utc, -- this function transform numberic columns to timestamp
    to_timestamp (sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swtime,
    to_timestamp (sunsetTime) AS sunset_utc,
    to_timestamp (sunsetTime) AT TIME ZONE 'Europe/Stockholm' AS sunset_swtime,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

-- note the use of single and double quotations
--------------------------------------------------------------------------
/* TASK 5 */
SELECT
    to_timestamp (sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swtime,
    to_timestamp (sunsetTime) AT TIME ZONE 'Europe/Stockholm' AS sunset_swtime,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

-- the new year and month columns involves substracting a part of timestamps
-- pick  up the date with the largest gap within a month involves the use of aggregation function.
-- the gaps can be calculated directly with UNIX time
SELECT
    date_part ('year', to_timestamp (sunriseTime)) AS year,
    date_part ('month', to_timestamp (sunriseTime)) AS month
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

SELECT
    date_part ('year', to_timestamp (sunriseTime)) AS year,
    date_part ('month', to_timestamp (sunriseTime)) AS month,
    ROUND(MAX(sunsetTime - sunriseTime) / 3600) AS gap_hours
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
GROUP BY
    year,
    month
ORDER BY
    year,
    month;

SELECT
    date_part ('year', to_timestamp (sunriseTime)) AS year,
    date_part ('month', to_timestamp (sunriseTime)) AS month,
    to_timestamp (MAX(sunriseTime)),
    to_timestamp (MAX(sunsetTime)),
    ROUND(MAX(sunsetTime - sunriseTime) / 3600, 2) AS gap_hours
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden'
GROUP BY
    year,
    month
ORDER BY
    year,
    month;

--------------------------------------------------------------------------
/* TASK 5 */
-- concanate integer and string
--concanate string and string
SELECT
    to_timestamp (windGustTime) AT TIME ZONE 'Europe/Stockholm' AS most_windy_timestamp,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';

SELECT
    to_timestamp (windGustTime) AT TIME ZONE 'Europe/Stockholm' AS most_windy_timestamp,
    date_part ('hour', most_windy_timestamp) AS most_windy_timestamp,
FROM
    staging.weather
WHERE
    "Country/Region" = 'Sweden';