
# Connect to PostgreSQL database
psql -d database -U  user -W
psql -h host -d database -U user -W

# Switch connection to a new database
\c dbname username

# List available databases
\l

# List available tables
\dt

# Describe a table
\d table_name

# List available schema
\dn

# List available functions
\df

# List available views
\dv

# List users and their roles
\du

# Execute the previous command
\g

# Command history
\s

# Execute psql commands from a file
\i filename

# Get help on psql commands
\?
\h ALTER TABLE

# Quit psql
\q

# Create database
create database mydb;

# create a database on a server using docker container
docker run --rm -i -e PGPASSWORD="root" postgres:14.5 psql -h 172.200.111.166 -U root -d postgres -c 'create database mydb;'

# Create user
create user myuser with encrypted password 'mypass';

# Grant access to user
grant all privileges on database mydb to myuser;

#######################################################

# Backup Large PostgreSQL Databases
pg_dump likeit | gzip > likeit.gz

# If the database is extremely large, you can dump in parallel by dumping number_of_jobs tables simultaneously using the -j flag
pg_dump -F d -j 5 -f likeit

# dump specific database
PGPASSWORD="password" pg_dump -h HOST -U root -p PORT likeit > likeit.sql

# dump specific database using docker container
docker run --rm -i -e PGPASSWORD="root" postgres:14.5 pg_dump -h 172.20.111.166 -U root dbname > dbname.sql

# Restoring a PostgreSQL Database
psql likeit < likeit.sql

# Restoring a PostgreSQL Database using docker container
docker run -i --rm -e PGPASSWORD="root" -v /dbname.sql:/dbname.sql postgres:14.5 psql -h 172.200.111.166 -U root -d dbname < dbname.sql

# list and terminate database connection with pid
SELECT * FROM pg_stat_activity;
SELECT pg_terminate_backend(239);