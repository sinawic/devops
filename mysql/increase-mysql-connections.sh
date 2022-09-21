#!/bin/bash
#title           :increase-mysql-connections.sh
#description     :This script will increase max connections of a mysql server
#author          :sinawic
#date            :20220921


docker run -i --rm mysql:5.7 mysql --host=1.2.3.4 --port=3306 --user=root -proot --protocol=tcp -e "SET GLOBAL max_connections = 500"

docker run -i --rm mysql:5.7 mysql --host=1.2.3.4 --port=3306 --user=root -proot --protocol=tcp -e 'SHOW VARIABLES LIKE "max_connections"'

echo done...

