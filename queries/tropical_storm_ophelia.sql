
WITH HourlyWeather AS (
    SELECT
        strftime('%Y-%m-%d %H:00:00', "DATE") AS date_hour,
        SUM("HourlyPrecipitation") AS total_precipitation,
        AVG("HourlyWindSpeed") AS avg_wind_speed
    FROM hourly_weather
    WHERE "DATE" BETWEEN '2023-09-25' AND '2023-10-03'
    GROUP BY strftime('%Y-%m-%d %H:00:00', "DATE")
),
HourlyTrips AS (
    SELECT
        strftime('%Y-%m-%d %H:00:00', pickup_datetime) AS trip_hour,
        COUNT(*) AS total_rides
    FROM (
        SELECT pickup_datetime FROM taxi_trips
        UNION ALL
        SELECT pickup_datetime FROM uber_trips
    ) AS combined_trips
    WHERE pickup_datetime BETWEEN '2023-09-25 00:00:00' AND '2023-10-03 23:59:59'
    GROUP BY strftime('%Y-%m-%d %H:00:00', pickup_datetime)
)
SELECT
    COALESCE(HourlyWeather.date_hour, HourlyTrips.trip_hour) AS date_hour,
    COALESCE(HourlyTrips.total_rides, 0) AS total_rides,
    COALESCE(HourlyWeather.total_precipitation, 0) AS total_precipitation,
    COALESCE(HourlyWeather.avg_wind_speed, 0) AS avg_wind_speed
FROM
    HourlyWeather
FULL OUTER JOIN
    HourlyTrips
ON
    HourlyWeather.date_hour = HourlyTrips.trip_hour
ORDER BY
    date_hour ASC;
