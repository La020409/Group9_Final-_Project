
CREATE TABLE IF NOT EXISTS hourly_weather (
    date TEXT,
    latitude REAL,
    longitude REAL,
    elevation REAL,
    hourly_precipitation REAL,
    hourly_relative_humidity REAL,
    hourly_visibility REAL,
    hourly_wind_speed REAL,
    backup_elements TEXT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    date TEXT,
    latitude REAL,
    longitude REAL,
    elevation REAL,
    daily_precipitation REAL,
    daily_relative_humidity REAL,
    daily_visibility REAL,
    daily_wind_speed REAL,
    backup_elements TEXT,
    daily_snow_depth REAL,  
    daily_snowfall REAL
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    pickup_latitude REAL,
    pickup_longitude REAL,
    dropoff_latitude REAL,
    dropoff_longitude REAL,
    passenger_count INTEGER,
    trip_distance REAL,
    fare_amount REAL,
    tip_amount REAL,
    tolls_amount REAL,
    mta_tax REAL,
    total_amount REAL,
    congestion_surcharge REAL
);

CREATE TABLE IF NOT EXISTS uber_trips (
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    pickup_latitude REAL,
    pickup_longitude REAL,
    dropoff_latitude REAL,
    dropoff_longitude REAL,
    trip_miles REAL,
    tips REAL,
    trip_time INTEGER,
    base_passenger_fare REAL,
    tolls REAL,
    sales_tax REAL,
    congestion_surcharge REAL
);

CREATE TABLE IF NOT EXISTS sunrise_sunset (
    date DATE PRIMARY KEY,
    sunrise TIME,
    sunset TIME
);
