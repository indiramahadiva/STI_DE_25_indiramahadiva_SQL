DESC staging.sweden_holidays;

FROM
    staging.sweden_holidays
LIMIT
    5;

-- addition and subtraction
SELECT
    date,
    date + interval 5 day AS plus_5_days,
    typeof (plus_5_days) AS plus_5_days_type,
    date - interval 5 day AS minus_5_days,
FROM
    staging.sweden_holidays;

-- DATE function
SELECT
    today ();

SELECT
    *,
    today () AS today
FROM
    staging.sweden_holidays;

SELECT
    today () AS today,
    date - today as time_after_holiday,
    *
FROM
    staging.sweden_holidays;

-- Pick out weekday
SELECT
    date,
    dayname (date) as weekday
FROM
    staging.sweden_holidays;

-- latest from two dates
SELECT
    *,
    today () as today,
    greatest (date, today) as later_day
FROM
    staging.sweden_holidays;

-- convert date to string
SELECT
    date,
    strftime (date, '%d/%m/%Y') as date_string,
    typeof (date_string)
FROM
    staging.sweden_holidays;

-- convert from string to date
SELECT
    date,
    strftime (date, '%d/%m/%Y') as date_string,
    typeof (date_string),
    strptime (date_string, '%d/%m/%Y')::DATE as new_date,
    typeof (new_date)
FROM
    staging.sweden_holidays;

-- convert string to timestamp
select 
	Date,
	strptime('2025-12-31', '%Y-%m-%d') as Date_Timestamp
from staging.sweden_holidays;