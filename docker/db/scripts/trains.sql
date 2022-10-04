CREATE schema IF NOT EXISTS trains;

CREATE TABLE IF NOT EXISTS hospital.train (
	train_nr INTEGER PRIMARY KEY,
	length INTEGER NOT NULL,
	FOREIGN KEY (city_name, city_region) REFERENCES hospital.city(city_name, city_region),
	start_station VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	end_station VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	connected_id VARCHAR(50) NOT NULL REFERENCES trains.station(connected_id)
);

CREATE TABLE IF NOT EXISTS hospital.connected (
	connected_id INTEGER NOT NULL,
	departure VARCHAR(50) NOT NULL REFERENCES trains.station(name),
	arrival VARCHAR(50) NOT NULL REFERENCES trains.station(name)
);

CREATE TABLE IF NOT EXISTS hospital.station (
	name VARCHAR(50) PRIMARY KEY,
	number_of_tracks INTEGER PRIMARY KEY
);


CREATE TABLE IF NOT EXISTS hospital.city (
	region VARCHAR(50) NOT NULL,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (name, region)
);

