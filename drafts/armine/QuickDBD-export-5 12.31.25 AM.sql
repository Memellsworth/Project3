-- Database: main_db

-- DROP DATABASE IF EXISTS main_db;

CREATE DATABASE main_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "IAH_Airline_Delay_Cause" (
    
    "year" INTEGER NOT NULL, 
    "month" INTEGER   NOT NULL,
    "carrier" VARCHAR   NOT NULL,
    "carrier_name" VARCHAR   NOT NULL,
    "airport" VARCHAR   NOT NULL,
    "airport_name" VARCHAR   NOT NULL,
    "arr_flights" FLOAT   NOT NULL,
    "arr_del15" FLOAT   NOT NULL,
    "carrier_ct" FLOAT   NOT NULL,
    "weather_ct" FLOAT   NOT NULL,
    "nas_ct" FLOAT   NOT NULL,
    "security_ct" FLOAT   NOT NULL,
    "late_aircraft_ct" FLOAT   NOT NULL,
    "arr_cancelled" FLOAT   NOT NULL,
    "arr_diverted" FLOAT   NOT NULL,
    "arr_delay" FLOAT   NOT NULL,
    "carrier_delay" FLOAT   NOT NULL,
    "weather_delay" FLOAT   NOT NULL,
    "nas_delay" FLOAT   NOT NULL,
    "security_delay" FLOAT   NOT NULL,
    "late_aircraft_delay" FLOAT   NOT NULL
  
);

CREATE TABLE "AS" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
);

CREATE TABLE "EV" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
   
);

CREATE TABLE "UA" (
   
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
  
);

CREATE TABLE "NK" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "WN" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "B6" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "F9" (
   
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "MQ" (
   
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
   
);

CREATE TABLE "9E" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "OO" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "AA" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
   
);


CREATE TABLE "DL" (
    
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
    
);

CREATE TABLE "YX" (
    
    
     "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" DATE   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" VARCHAR,
    "Destination Airport" VARCHAR   NOT NULL,
    "Scheduled departure time" time,
    "Actual departure time" time,
    "Scheduled elapsed time (Minutes)" INTEGER,
    "Actual elapsed time (Minutes)" INTEGER,
    "Departure delay (Minutes)" INTEGER,
    "Wheels-off time" time,
    "Taxi-Out time (Minutes)" INTEGER,
    "Delay Carrier (Minutes)" INTEGER,
    "Delay Weather (Minutes)" INTEGER,
    "Delay National Aviation System (Minutes)" INTEGER,
    "Delay Security (Minutes)" INTEGER,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER
   
);







