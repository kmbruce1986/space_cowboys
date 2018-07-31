DROP TABLE IF EXISTS space_cowboys;
CREATE TABLE space_cowboys (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT,
  danger_level VARCHAR(255),
  cashed_in BOOLEAN
);
