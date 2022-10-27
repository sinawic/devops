
# Installing SSH Utilities
sudo apt-get install openssh-client openssh-server

sudo systemctl start sshd

sudo systemctl enable sshd

# Local Port Forwarding
# server 192.168.199.153:80 has a webserver on port 80
# with this command it is forwarded to localhost:6900
ssh -L 6900:192.168.199.153:80 localhost
# type in the password of your local computer and press <Enter>
# visit http://localhost:6900


# Remote Port Forwarding
# configure server to allow forwarded ports to be accessed over the internet
sudo nano /etc/ssh/sshd_config

# find GatewayPorts
# uncomment it and set it to yes

sudo systemctl restart sshd

# there is a webserver on localhost port 80
# with this command it is forwarded to the 192.168.199.153 on port 9999
ssh -R 9999:localhost:80 192.168.199.153
# Type in the password of remote server