#!/bin/bash
#title           :mysql-transfer-databases.sh
#description     :This script will transfer databases from a server to another
#author          :sinawic
#date            :20220921

array=(
  im_user_0_test
  im_user_1_test
)

for i in "${array[@]}"
do

  docker run -i --rm mysql:5.7 mysqldump --host=1.2.3.4 --port=3306 --default-character-set=utf8 --user=root -proot --protocol=tcp --skip-triggers --databases $i > $i.sql

  mysql --protocol=tcp --host=1.2.3.40 --user=root -proot --port=3306 --default-character-set=utf8 --comments < $i.sql

  echo $i done...

done
