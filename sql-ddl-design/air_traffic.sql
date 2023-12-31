-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat_number VARCHAR(3) NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  departure TIMESTAMP WITH TIME ZONE NOT NULL,
  arrival TIMESTAMP WITH TIME ZONE NOT NULL,
  seat_id INT REFERENCES seats(id),
  airline_id INT REFERENCES airlines(id),
  airport_id INT REFERENCES locations(id)
);

INSERT INTO airlines (name)
VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO seats 
  (seat_number)
VALUES
('33B'),
('8A'),
('12F'),
('20A'),
('23D'),
('18C'),
('9E'),
('1A'),
('32B'),
('10D');

INSERT INTO locations 
  (to_city, to_country, from_city, from_country)
VALUES
('Washington DC', 'United States', 'Seattle', 'United States'),
('Tokyo', 'Japan', 'London', 'United Kingdom'),
('Los Angeles', 'United States', 'Las Vegas', 'United States'),
('Seattle', 'United States', 'Mexico City', 'Mexico'),
('Paris', 'France', 'Casablanca', 'Morocco'),
('Dubai', 'UAE', 'Beijing', 'China'),
('New York', 'United States', 'Charlotte', 'United States'),
('Cedar Rapids', 'United States', 'Chicago', 'United States'),
('Charlotte', 'United States', 'New Orleans', 'United States'),
('Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO tickets
  (first_name, last_name, departure, arrival, seat_id, airline_id, airport_id)
VALUES
  ('Jennifer', 'Finch', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1),
  ('Thadeus', 'Gathercoal', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2),
  ('Sonja', 'Pauley', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 3),
  ('Jennifer', 'Finch', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 3, 4),
  ('Waneta', 'Skeleton', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 4, 5),
  ('Thadeus', 'Gathercoal', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 5, 6),
  ('Berkie', 'Wycliff', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 1, 7),
  ('Alvin', 'Leathes', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 6, 8),
  ('Berkie', 'Wycliff', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9, 6, 9),
  ('Cory', 'Squibbes', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10, 7, 10);

  