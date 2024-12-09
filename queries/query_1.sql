
SELECT 
    strftime('%H', pickup_datetime) AS hour,
    COUNT(*) AS ride_count
FROM 
    taxi_trips
GROUP BY 
    hour
ORDER BY 
    ride_count DESC;
