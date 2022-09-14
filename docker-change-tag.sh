#!/bin/bash
#title           :docker-change-tag.sh
#description     :This script will transfer image from a registry to another
#author          :sinawic
#date            :20220914

# 
# suppose we have some images tagged to a registry
# and we want to transfer them to another registry
# 

OLD_BASE="sumdomain.domain.com/"
BASE_NEW="gitlab.domain.com:5050/user/project:"

array=(
  nginx:latest
  # ...
  apps/alpine:1.0 )

for i in "${array[@]}"
do
	docker tag $OLD_BASE$i $BASE_NEW`echo "$i" | sed "s/\//-/g" | sed "s/:/-/g"`
	docker push $BASE_NEW`echo "$i" | sed "s/\//-/g" | sed "s/:/-/g"`

  # remove images from local storage, comment out if not needed
  docker rmi $BASE_NEW`echo "$i" | sed "s/\//-/g" | sed "s/:/-/g"`
  docker rmi $OLD_BASE$i

	echo $BASE_NEW`echo "$i" | sed "s/\//-/g" | sed "s/:/-/g"``echo " ==>  $OLD_BASE$i"` 
done
