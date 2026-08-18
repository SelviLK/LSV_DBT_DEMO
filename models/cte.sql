WITH CTE AS (
    SELECT 
    to_timestamp(STARTED_AT),
    DATE(to_timestamp(STARTED_AT)) as DATE_AT,
    dayname(to_timestamp(STARTED_AT)) AS DAT
    FROM {{ source('lsv_dbt', 'bike') }}
)
SELECT * FROM CTE