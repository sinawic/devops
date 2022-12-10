

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

# get active ssh connections to server
sudo netstat -tnpa | grep 'ESTABLISHED.*sshd'

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
