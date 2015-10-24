-- Create Hive tables for Pronto project
-- Data source: csv file (comma delim, no qoutes on strings)
-- date created: 10/23/2015
-- version: 1
-- author: blair vanderlugt

CREATE TABLE pronto_challenge.station (
    id INT,
    name VARCHAR, 
	terminal VARCHAR, 
	lat DOUBLE, 
	long DOUBLE, 
	dockcount INT, 
	online DATE)
COMMENT 'Pronto station data from challenge data set'
ROW FORMAT DELIMITED FIELDS BY ','
STORED AS TEXTFILE;

CREATE TABLE pronto_challenge.weather (
    Date DATE, 
	Max_Temperature_F INT, 
	Mean_Temperature_F INT, 
	Min_TemperatureF INT, 
	Max_Dew_Point_F INT, 
	MeanDew_Point_F INT, 
	Min_Dewpoint_F INT, 
	Max_Humidity INT, 
	Mean_Humidity INT, 
	Min_Humidity INT, 
	Max_Sea_Level_Pressure_In INT, 
	Mean_Sea_Level_Pressure_In INT, 
	Min_Sea_Level_Pressure_In INT, 
	Max_Visibility_Miles INT, 
	Mean_Visibility_Miles INT, 
	Min_Visibility_Miles INT, 
	Max_Wind_Speed_MPH INT, 
	Mean_Wind_Speed_MPH INT, 
	Max_Gust_Speed_MPH INT, 
	Precipitation_In FLOAT , 
	Events VARCHAR)
COMMENT 'Pronto weather data from challenge data set'
ROW FROMAT DELIMITED FIELDS BY ','
STORED AS TEXTFILE;

CREATE TABLE pronto_challenge.status (
	station_id INT, 
	bikes_available INT, 
	docks_available INT, 
	bikes_blocked INT, 
	docks_blocked INT, 
	time TIMESTAMP)
COMMENT 'Pronto status data from challenge data set'
ROW FROMAT DELIMITED FIELDS BY ','
STORED AS TEXTFILE;

CREATE TABLE pronto_challenge.trip (
	trip_id INT, 
	starttime TIMESTAMP, 
	stoptime TIMESTAMP, 
	bikeid INT, 
	tripduration FLOAT, 
	from_station_name VARCHAR, 
	to_station_name VARCHAR, 
	from_station_id VARCHAR, 
	to_station_id VARCHAR, 
	usertype VARCHAR, 
	gender VARCHAR, 
	birthyear INT)
COMMENT 'Pronto trip data from challenge data set'
ROW FROMAT DELIMITED FIELDS BY ','
STORED AS TEXTFILE;
