
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

# Create user
create user myuser with encrypted password 'mypass';

# Grant access to user
grant all privileges on database mydb to myuser;