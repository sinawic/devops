#!/bin/bash

sudo groupadd docker
usermod -aG docker $USER
sudo systemctl restart docker

sudo gpasswd -a $USER docker
# sudo chmod 666 /var/run/docker.sock
# sudo setfacl --modify user::rw /var/run/docker.sock