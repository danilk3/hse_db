CREATE schema IF NOT EXISTS trains;

CREATE TABLE IF NOT EXISTS trains.station (
	name VARCHAR(50) PRIMARY KEY,
	number_of_tracks INTEGER
);

CREATE TABLE IF NOT EXISTS trains.city (
	city_region VARCHAR(50) NOT NULL,
	city_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (city_region, city_name)
);

CREATE TABLE IF NOT EXISTS trains.connected (
	connected_id INTEGER PRIMARY KEY,
	departure VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	arrival VARCHAR(50) NOT NULL REFERENCES trains.station(name)
);

CREATE TABLE IF NOT EXISTS trains.train (
	train_nr INTEGER PRIMARY KEY,
	length INTEGER NOT NULL,
  city_name VARCHAR(50) NOT NULL,
  city_region VARCHAR(50) NOT NULL,
	FOREIGN KEY (city_region, city_name) REFERENCES trains.city(city_region, city_name),
	start_station VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	end_station VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	connected_id INTEGER NOT NULL REFERENCES trains.connected(connected_id)
);