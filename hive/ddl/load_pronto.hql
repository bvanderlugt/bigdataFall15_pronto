-- Load Hive tables for Pronto project
-- Data source: csv file (comma delim, no qoutes on strings)
-- date created: 10/23/2015
-- version: 1
-- author: blair vanderlugt

LOAD DATA INPATH '/user/blair/pronto/data/2015_station_data_nohead.csv' OVERWRITE INTO TABLE pronto_challenge.station;

LOAD DATA INPATH '/user/blair/pronto/data/2015_status_data_nohead.csv' OVERWRITE INTO TABLE pronto_challenge.status;

LOAD DATA INPATH '/user/blair/pronto/data/2015_trip_data_nohead.csv' OVERWRITE INTO TABLE pronto_challenge.trip;

LOAD DATA INPATH '/user/blair/pronto/data/2015_weather_data_nohead.csv' OVERWRITE INTO TABLE pronto_challenge.weather;