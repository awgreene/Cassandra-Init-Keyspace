# Check that all envirment variables have been set.
echo "CASSANDRA_IP:$CASSANDRA_IP"
echo "CASSANDRA_PORT:$CASSANDRA_PORT"
echo "CASSANDRA_ADMIN_USERNAME:$CASSANDRA_ADMIN_USERNAME"
echo "CASSANDRA_ADMIN_PASSWORD:$CASSANDRA_ADMIN_PASSWORD"
echo "CASSANDRA_KEYSPACE:$CASSANDRA_KEYSPACE"

# Echo all commands for debug.
set -x

# Create Cassandra Keyspace
sed -i s/\<CASSANDRA_KEYSPACE\>/$CASSANDRA_KEYSPACE/g $1 /scripts/initKeyspace.cql
cqlsh -u $CASSANDRA_ADMIN_USERNAME -p $CASSANDRA_ADMIN_PASSWORD -f /scripts/initKeyspace.cql $CASSANDRA_IP $CASSANDRA_PORT

# Create Cassandra Tables
sed -i s/\<CASSANDRA_KEYSPACE\>/$CASSANDRA_KEYSPACE/g $1 /scripts/initTables.cql
cqlsh -u $CASSANDRA_ADMIN_USERNAME -p $CASSANDRA_ADMIN_PASSWORD -f /scripts/initTables.cql $CASSANDRA_IP $CASSANDRA_PORT
