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

# Datagrip need user’s password to connect. Empty password will throw irrelevant error. That’s why we need to add password to postgres user
sudo -u postgres psql postgres
sudo -u postgres psql

postgres-# \password postgres


# for installing postgreSQL with django visit https://djangocentral.com/using-postgresql-with-django/
# https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-20-04
# First, create a database for your project:
CREATE DATABASE myproject;

# Next, create a database user for our project. Make sure to select a secure password:
CREATE USER myprojectuser WITH PASSWORD 'password';

# These are all recommendations from the Django project itself: https://docs.djangoproject.com/en/3.0/ref/databases/#optimizing-postgresql-s-configuration
ALTER ROLE myprojectuser SET client_encoding TO 'utf8';
ALTER ROLE myprojectuser SET default_transaction_isolation TO 'read committed';
ALTER ROLE myprojectuser SET timezone TO 'UTC';

# Now, we can give our new user access to administer our new database:
GRANT ALL PRIVILEGES ON DATABASE myproject TO myprojectuser;

postgres-# \q

# installing psycopg2 vs. psycopg2-binary
##########################################
# Psycopg2: requires a few prerequisites (a C compiler, some development packages) to be built.
# psycopg2-binary: a stand-alone package, not requiring a compiler or external libraries,
pip install psycopg2-binary


