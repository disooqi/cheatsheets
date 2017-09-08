#!/bin/sh
# https://resources.mongodb.com/getting-started-with-mongodb?jmp=nav&_ga=2.109690625.569959245.1504789102-1950785271.1504789102
# https://resources.mongodb.com/getting-started-with-mongodb/getting-started-with-python-and-mongodb


sudo apt install mongodb-cliessh -L 4321:localhost:27017 root@104.131.19.52 -f -N

# sof -ti:4321 to find whatever is using port 4321.
# Pass the whole thing to kill -9 to kill whatever was using port 4321
lsof -ti:4321 | xargs kill -9
