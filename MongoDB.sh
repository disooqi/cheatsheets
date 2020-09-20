#!/bin/sh

https://mail.google.com/mail/u/0/#inbox/FMfcgxwChJgWqCzPbGCHqJTzjgTJjxWS

# https://resources.mongodb.com/getting-started-with-mongodb?jmp=nav&_ga=2.109690625.569959245.1504789102-1950785271.1504789102
# https://resources.mongodb.com/getting-started-with-mongodb/getting-started-with-python-and-mongodb
# https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-mongodb-on-ubuntu-16-04
# http://adnet.co.id/blog/tutorials-2/post/how-to-use-the-mongodb-one-click-application-348

# You can access your MongoDB instance remotely via an SSH tunnel using
ssh -L 4321:localhost:27017 root@104.131.19.52 -f -N

# sof -ti:4321 to find whatever is using port 4321.
# Pass the whole thing to kill -9 to kill whatever was using port 4321
lsof -ti:4321 | xargs kill -9


# Connecting to MongoDB Atlas
# https://docs.mongodb.com/manual/tutorial/getting-started/
# Install the PyMongo driver via pip:
python -m pip install pymongo

# and then try the following in python to make sure
client = pymongo.MongoClient("mongodb://kay:myRealPassword@mycluster0-shard-00-00-wpeiv.mongodb.net:27017,mycluster0-shard-00-01-wpeiv.mongodb.net:27017,mycluster0-shard-00-02-wpeiv.mongodb.net:27017/admin?ssl=true&replicaSet=Mycluster0-shard-0&authSource=admin")
db = client.test

# MongoDB plugin
https://medium.com/@kenwalger/mongodb-plugin-for-pycharm-93bea25ff685

# MongoDB and Python
https://realpython.com/blog/python/introduction-to-mongodb-and-python/
http://www.bogotobogo.com/python/MongoDB_PyMongo/python_MongoDB_pyMongo_tutorial_installing.php
https://marcobonzanini.com/2015/09/07/getting-started-with-mongodb-and-python/

