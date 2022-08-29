#!/bin/bash

# install nodejs base
sudo apt install nodejs

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# after a shell termination, install specific version of node
# for the initial install it will also automatically be set to default
nvm install v16.16.0
