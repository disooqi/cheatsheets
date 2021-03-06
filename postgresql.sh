sudo apt install postgresql postgresql-contrib

# setup a new role
sudo -u postgres createuser --interactive

# setup a new DB; the DB should have the same name as the new role and the linux user
sudo -u postgres createdb testdb

# Create new user in ubuntu
sudo adduser arabagent

# connect to the database by typing:
sudo -u arabagent psql

# to quit
arabagent-# \q
