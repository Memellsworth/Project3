select * from "Delays"
where year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=1 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=2 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=3 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=4 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=5 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=6 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=7 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=8 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=9 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=10 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=11 and year=2022;

select avg(arr_delay+carrier_delay+weather_delay+nas_delay+security_delay+late_aircraft_delay)
from "Delays"
where month=12 and year=2022;



-- Create a new table
CREATE TABLE average_delay_per_month (
  Month VARCHAR NOT NULL,
  Average_Delay INTEGER
);

-- Insert data into the table
INSERT INTO average_delay_per_month (Month, Average_Delay)
VALUES ('Jan', 23508),
  ('Feb', 19938),
  ('Mar', 23095),
  ('Apr', 20362),
  ('May', 24134),
  ('Jun', 21267),
  ('Jul', 21195),
  ('Aug', 26314),
  ('Sep', 13635),
  ('Oct', 13277),
  ('Nov', 19561),
  ('Dec', 31418);
  
  select * from average_delay_per_month