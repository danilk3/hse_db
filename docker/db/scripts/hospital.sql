CREATE schema IF NOT EXISTS hospital;

CREATE TABLE IF NOT EXISTS hospital.patient (
	patient_id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	desease VARCHAR(50) NOT NULL,
	from_date TIMESTAMP,
	to_date TIMESTAMP,
	doctor_id INTEGER NOT NULL REFERENCES hospital.doctor(pers_nr),
	room_id INTEGER NOT NULL REFERENCES hospital.room(room_id)
);

CREATE TABLE IF NOT EXISTS hospital.doctor (
	pers_nr INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	rank INTEGER NOT NULL,
	area VARCHAR(50) NOT NULL,
	station_id INTEGER NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.caregiver (
	pers_nr INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	qualification VARCHAR(50) NOT NULL,
	station_id INTEGER NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.station (
	station_id INTEGER PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS hospital.room (
	room_id INTEGER PRIMARY KEY,
	number_of_beds INTEGER NOT NULL,
	station_id INTEGER NOT NULL REFERENCES hospital.station(station_id)
);

CREATE TABLE IF NOT EXISTS hospital.station_personell (
  pers_nr INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  station_id INTEGER NOT NULL REFERENCES hospital.station(station_id)
);