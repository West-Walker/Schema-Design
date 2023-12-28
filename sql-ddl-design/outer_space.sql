-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons 
(
  id SERIAL PRIMARY KEY,
  name TEXT[]
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INT REFERENCES stars(id) ,
  galaxy TEXT NOT NULL,
  moon_id INT REFERENCES moons(id)
);

INSERT INTO moons (name)
VALUES
('{"The Moon"}'),
('{"Phobos", "Deimos"}'),
('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('{}');

INSERT INTO stars (name)
VALUES
('The Sun'),
('Gliese 876'),
('Proxima Centauri');

INSERT INTO planets
  (name, orbital_period_in_years, star_id, galaxy, moon_id)
VALUES
  ('Earth', 1.00, 1, 'Milky Way', 1),
  ('Mars', 1.88, 1, 'Milky Way', 2),
  ('Venus', 0.62, 1, 'Milky Way', 4),
  ('Neptune', 164.8, 1, 'Milky Way', 3),
  ('Proxima Centauri b', 0.03, 3, 'Milky Way', 4),
  ('Gliese 876 b', 0.23, 2, 'Milky Way', 4);