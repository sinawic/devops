#!/bin/bash

# verify whether pip is already installed
python3 -m pip -V

# to install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user

# Installing Ansible
python3 -m pip install --user ansible

# Alternately, to install a specific version
python3 -m pip install --user ansible-core==2.12.3

# Upgrading Ansible
python3 -m pip install --upgrade --user ansible

# adding ansible bin path to $PATH
# so that it will be accessible from anywhere in the terminal
# add the following to the end of /home/username/.bashrc file
export PATH="/home/username/.local/bin/:$PATH"

# restart the current terminal to apply the .bashrc changes
# have some fun, then again