
WITH snowiest_days AS (
    SELECT 
        strftime('%Y-%m-%d', date) AS date,
        DailySnowfall
    FROM 
        daily_weather
    WHERE 
        DailySnowfall > 0
    GROUP BY 
        date
    ORDER BY 
        DailySnowfall DESC
    LIMIT 10
),
total_rides AS (
    SELECT 
        strftime('%Y-%m-%d', pickup_datetime) AS date
    FROM 
        taxi_trips
    UNION ALL
    SELECT 
        strftime('%Y-%m-%d', pickup_datetime) AS date
    FROM 
        uber_trips
),
ride_counts AS (
    SELECT 
        COUNT(*) AS ride_count,
        date
    FROM 
        total_rides
    GROUP BY 
        date
)
SELECT 
    s.date,
    s.DailySnowfall,
    COALESCE(c.ride_count, 0) AS ride_count
FROM 
    snowiest_days s
LEFT JOIN 
    ride_counts c
ON 
    s.date = c.date
GROUP BY 
    s.date
ORDER BY 
    s.DailySnowfall DESC;
