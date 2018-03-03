CREATE TABLE <CASSANDRA_KEYSPACE>.users (
  userid text PRIMARY KEY,
  username text,
);

// Populate tables here:
INSERT INTO <CASSANDRA_KEYSPACE>.users (userid, username) VALUES('1234', 'Darth Vader');
