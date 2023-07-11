-- Database: main_db

-- DROP DATABASE IF EXISTS main_db;

CREATE DATABASE final_db
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
    "year" INTEGER   NOT NULL,
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
    "late_aircraft_delay" FLOAT   NOT NULL,
    CONSTRAINT "pk_IAH_Airline_Delay_Cause" PRIMARY KEY (
        "carrier"
     )
);

CREATE TABLE "carrier_group" (
    "Carrier Code" VARCHAR   NOT NULL,
    "Date (MM/DD/YYYY)" INTEGER   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" INTEGER   NOT NULL,
    "Destination Airport" INTEGER   NOT NULL,
    "Scheduled departure time" INTEGER   NOT NULL,
    "Actual departure time" INTEGER   NOT NULL,
    "Scheduled elapsed time (Minutes)" INTEGER   NOT NULL,
    "Actual elapsed time (Minutes)" INTEGER   NOT NULL,
    "Departure delay (Minutes)" INTEGER   NOT NULL,
    "Wheels-off time" INTEGER   NOT NULL,
    "Taxi-Out time (Minutes)" INTEGER   NOT NULL,
    "Delay Carrier (Minutes)" INTEGER   NOT NULL,
    "Delay Weather (Minutes)" INTEGER   NOT NULL,
    "Delay National Aviation System (Minutes)" INTEGER   NOT NULL,
    "Delay Security (Minutes)" INTEGER   NOT NULL,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER   NOT NULL,
    CONSTRAINT "pk_carrier_group" PRIMARY KEY (
        "Carrier Code"
     )
);

CREATE TABLE "dest_airport" (
    "Destination Airport" VARCHAR   NOT NULL,
    "Carrier Code" INTEGER   NOT NULL,
    "Date (MM/DD/YYYY)" INTEGER   NOT NULL,
    "Flight Number" INTEGER   NOT NULL,
    "Tail Number" INTEGER   NOT NULL,
    "Scheduled departure time" INTEGER   NOT NULL,
    "Actual departure time" INTEGER   NOT NULL,
    "Scheduled elapsed time (Minutes)" INTEGER   NOT NULL,
    "Actual elapsed time (Minutes)" INTEGER   NOT NULL,
    "Departure delay (Minutes)" INTEGER   NOT NULL,
    "Wheels-off time" INTEGER   NOT NULL,
    "Taxi-Out time (Minutes)" INTEGER   NOT NULL,
    "Delay Carrier (Minutes)" INTEGER   NOT NULL,
    "Delay Weather (Minutes)" INTEGER   NOT NULL,
    "Delay National Aviation System (Minutes)" INTEGER   NOT NULL,
    "Delay Security (Minutes)" INTEGER   NOT NULL,
    "Delay Late Aircraft Arrival (Minutes)" INTEGER   NOT NULL,
    CONSTRAINT "pk_dest_airport" PRIMARY KEY (
        "Destination Airport"
     )
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_AS" PRIMARY KEY (
        "Carrier Code"
     )
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_EV" PRIMARY KEY (
        "Carrier Code"
     )
   
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_UA" PRIMARY KEY (
        "Carrier Code"
     )
  
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_NK" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_WN" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_B6" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_F9" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_MQ" PRIMARY KEY (
        "Carrier Code"
     )
   
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_9E" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_OO" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_AA" PRIMARY KEY (
        "Carrier Code"
     )
   
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_DL" PRIMARY KEY (
        "Carrier Code"
     )
    
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
    "Delay Late Aircraft Arrival (Minutes)" INTEGER,
     CONSTRAINT "pk_YX" PRIMARY KEY (
        "Carrier Code"
     )
   
);


ALTER TABLE "IAH_Airline_Delay_Cause" ADD CONSTRAINT "fk_IAH_Airline_Delay_Cause_carrier" FOREIGN KEY("carrier")
REFERENCES "carrier_group" ("Carrier Code");


ALTER TABLE "AS" ADD CONSTRAINT "fk_AS_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "EV" ADD CONSTRAINT "fk_EV_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "UA" ADD CONSTRAINT "fk_UA_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "NK" ADD CONSTRAINT "fk_NK_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "WN" ADD CONSTRAINT "fk_WN_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "B6" ADD CONSTRAINT "fk_B6_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "F9" ADD CONSTRAINT "fk_F9_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "MQ" ADD CONSTRAINT "fk_MQ_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "9E" ADD CONSTRAINT "fk_9E_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "OO" ADD CONSTRAINT "fk_OO_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "AA" ADD CONSTRAINT "fk_AA_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "DL" ADD CONSTRAINT "fk_DL_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");

ALTER TABLE "YX" ADD CONSTRAINT "fk_YX_Carrier_Code" FOREIGN KEY("Carrier Code")
REFERENCES "carrier_group" ("Carrier Code");



