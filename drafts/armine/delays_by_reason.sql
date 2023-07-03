-- Create a new table
CREATE TABLE Delays_by_Reason_2022(
  Reason VARCHAR NOT NULL,
 Total_Delays INTEGER
);

-- Insert data into the table
INSERT INTO Delays_by_Reason_2022 (Reason, Total_Delays)
VALUES ('Arrival Delay', 1557771),
  ('Weather Delay', 93009),
  ('National Aviation System Delay', 261469),
  ('Security Delay', 2287),
  ('Late Aircraft Delay', 522114);
  
select * from Delays_by_Reason_2022;