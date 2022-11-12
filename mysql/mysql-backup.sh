#!/bin/bash
#title           :mysql-backup.sh
#description     :This is a cheatsheet for mysql backup and restore commands
#author          :sinawic
#date            :20221112

# Backup a Single MySQL Database
mysqldump -u root -p database_name > database_name.sql

# Backup Multiple MySQL Databases
mysqldump -u root -p --databases database_name_a database_name_b > databases_a_b.sql

# Backup All MySQL Databases
mysqldump -u root -p --all-databases > all_databases.sql

# Backup all MySQL databases to separate files
for DB in $(mysql -e 'show databases' -s --skip-column-names); do
    mysqldump $DB > "$DB.sql";
done

# Create a Compressed MySQL Database Backup
mysqldump database_name | gzip > database_name.sql.gz

# Create a Backup with Timestamp
mysqldump  database_name > database_name-$(date +%Y%m%d).sql

#######################################################################################

# Restoring a MySQL dump
mysql -u root -p -e "create database database_name";
mysql -u root -p database_name < database_name.sql

# Restore a Single MySQL Database from a Full MySQL Dump
mysql --one-database database_name < all_databases.sql

# Export and Import a MySQL Database in One Command
mysqldump -u root -p database_name | mysql -h remote_host -u root -p remote_database_name

#######################################################################################

# Automate Backups with Cron
sudo nano ~/.my.cnf
#
# [client]
# user = dbuser
# password = dbpasswd
#
chmod 600 ~/.my.cnf
mkdir ~/db_backups
crontab -e
# Add the following cron job that will create a backup of a database name mydb every day at 3am:
0 3 * * * /usr/bin/mysqldump -u dbuser mydb > /home/username/db_backups/mydb-$(date +\%Y\%m\%d).sql
# You can also create another cronjob to delete any backups older than 30 days:
find /path/to/backups -type f -name "*.sql" -mtime +30 -delete

#######################################################################################

# gzip full import/export
mysqldump -u [user] -p [db_name] | gzip > [filename_to_compress.sql.gz]
gunzip < [compressed_filename.sql.gz]  | mysql -u [user] -p[password] [databasename]

# to drop specific tables from a database
# done in mysql query shell
# first get the list of tables we want to drop
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'dbname';

# set foreign_key_checks to false so the engine wont throw errors fo foreign keys
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS dbname.tbl1, dbname.tbl2;
SET foreign_key_checks = 1;

