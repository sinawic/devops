

# get directory sizes of a path /
du -cha --max-depth=1 / | grep -E "M|G"

# change the servers timezone
dpkg-reconfigure tzdata

# Extract JAR file
jar xvf /path/to/file.jar
# or
unzip /path/to/file.jar

# lists all files inside zip file
unzip -l /path/to/file.jar

# curl set header
curl -k -X GET \
  -X POST \
  https://localhost \
  -H 'Host: test.com'

# make linux user pass
mkpasswd -m sha-512

# reset gitlab user's pass
docker exec -it gitlab-web-1 gitlab-rake "gitlab:password:reset[root]"

# nmap look for all ports
sudo nmap -p- 0.0.0.0

# add a user to a group
usermod -aG groupname username

# remove a user from a group
gpasswd -d username groupname
sudo deluser username groupname


# when LV is not equal to all free disk available
# to extend LV while running the system without issue by doing the following to resize the LV after the install:
sudo lvresize -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
# and then resize the filesystem to fit the new space:
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

# Check Which Folders Use The Highest Disk Space
du -h / 2>/dev/null | grep '[0-9\.]\+G'

# get ur host ip
curl https://api.myip.com
curl https://iplocate.io/api/lookup/
curl -s https://api.ipify.org

# get active ssh connections to server
sudo netstat -tnpa | grep 'ESTABLISHED.*sshd'

# get ssh connections history
zgrep sshd /var/log/auth.log* -h |grep -F 'Accepted'

# Prevent SSH connection lost after logging into VPN on server machine
# before creating a vpn connection, first create a route
# -host being the ip of server gw being the ip of router
route add -host 1.2.3.4 gw 1.2.3.254
# or add an IP range route
route add -net 1.2.10.0/24 gw 1.2.11.254

# retrieve specific field from a json
curl https://site.com | jq -r '.country'

# systemd-resolve is used for DNS. You can flush systemd's caches like so
sudo systemd-resolve --flush-caches
# to check the local dns cache size
systemd-resolve --statistics

# bash: Test disk I/O speed from console/ssh
dd if=/dev/zero of=test bs=64k count=16k conv=fdatasync && rm test

# get user id of a linux user
id -u <username>

# check name resolution and connection to a service on a port
nc -vz postgres 5432
curl postgres:5432
telnet postgres 5432

# prevent a background process from logging
docker build -t x:x . 2>&1 &

# list sessions active jobs
jobs

# bring a background job to forward
fg %1

# send a job to background
bg %1
# or interactively by hitting Ctrl + z

# kill a job
kill %1

# replace a text in a file
sed -i 's/search_string/replace_string/' filename

# get a running docker container full id
docker inspect --format="{{.Id}}" httpd-container
# return format result as json. getting the raw value of .Status field
docker inspect --format="{{json .State.Health}}" httpd-container | jq -r .Status

# get list of running containers id
docker ps --format "{{.ID}}"
