WITH CTE AS (
    SELECT 
        to_timestamp(STARTED_AT),
        DATE(to_timestamp(STARTED_AT)) as DATE_AT,
        dayname(to_timestamp(STARTED_AT)) AS DAY_AT,
        {{date_utils('STARTED_AT',1)}} AS STATUS,
        {{date_utils('STARTED_AT',2)}} AS SEASON 
    FROM {{ source('lsv_dbt', 'bike') }}
)
SELECT * FROM CTE