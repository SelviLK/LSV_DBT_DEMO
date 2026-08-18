with weather_data as (
    select *
    from {{ source('lsv_dbt', 'weather') }}
),

weather_agg as (
    select         
    to_timestamp(time::number) as forecast_date,
    weather,
    round(avg(LAT),2) AS latitude,
    round(avg(LON),2) as lontitude,        
    from weather_data
    group by time, weather 
    qualify row_number() over(partition by  date(time::number)  order by weather, to_timestamp(time::number) desc) = 1
    
)
select * from weather_agg order by forecast_date