
WITH SunriseSunsetTrips AS (
    SELECT 
        tt.trip_distance,
        strftime('%w', tt.pickup_datetime) AS day_of_week,
        CASE 
            WHEN strftime('%H:%M', tt.pickup_datetime) < ss.sunrise THEN 'Before Sunrise'
            WHEN strftime('%H:%M', tt.pickup_datetime) > ss.sunset THEN 'After Sunset'
            ELSE 'Daytime'
        END AS time_period
    FROM 
        taxi_trips tt
    JOIN 
        sunrise_sunset ss
    ON 
        DATE(tt.pickup_datetime) = ss.date
)
SELECT 
    day_of_week,
    time_period,
    AVG(trip_distance) AS avg_trip_distance
FROM 
    SunriseSunsetTrips
WHERE 
    time_period IN ('Before Sunrise', 'After Sunset')
GROUP BY 
    day_of_week, time_period
ORDER BY 
    day_of_week, time_period;
