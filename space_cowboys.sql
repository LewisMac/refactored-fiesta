DROP TABLE space_cowboys;

CREATE TABLE space_cowboys (
id SERIAL8 primary key,
name VARCHAR(255),
species VARCHAR(255),
bounty INT4,
last_known_location VARCHAR(255)
);