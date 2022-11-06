#!/bin/bash
#title           :json-server.sh
#description     :This script will start up a light weight server which will serve a json file
#author          :sinawic
#date            :20221106

npm install -g json-server

# create db.json file
# {
#   "products": [
#     {
#       "id": 1,
#       "name": "ProX Watch",
#       "price": 20
#     }
#   ]
# }

# hit the following to start a hot reloading json server
json-server --watch --port=5000 --delay=1000 db.json

# each top level key in json file will be a route in the server