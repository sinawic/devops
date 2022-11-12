#!/bin/bash
#title           :postgres-transfer-databases.sh
#description     :This script will transfer a database from one instance to another
#author          :sinawic
#date            :202201112

WORKDIR=/home/sayadi/devops/postgres-chista
SOURCE_DBNAME=( 'dbname1' 'dbname2' )
SOURCE_IP=172.200.111.166
DEST_DBNAME=( 'dbname3' 'dbname4' )
DEST_IP=172.200.111.166

for i in ${!SOURCE_DBNAME[@]}; do

  # dump specific database using docker container
  docker run --rm -i -e PGPASSWORD="root" postgres:14.5 pg_dump -h $SOURCE_IP -U root ${SOURCE_DBNAME[$i]} > ${SOURCE_DBNAME[$i]}.sql

  # create a database on a server using docker container
  docker run --rm -i -e PGPASSWORD="root" postgres:14.5 psql -h $DEST_IP -U root -d postgres -c "create database ${DEST_DBNAME[$i]};"

  # Restoring a PostgreSQL Database using docker container
  docker run -i --rm -e PGPASSWORD="root" -v $WORKDIR/${SOURCE_DBNAME[$i]}.sql:/${SOURCE_DBNAME[$i]}.sql postgres:14.5 psql -h $DEST_IP -U root -d ${DEST_DBNAME[$i]} < ${SOURCE_DBNAME[$i]}.sql

  # clean up created file
  rm ${SOURCE_DBNAME[$i]}.sql

done
