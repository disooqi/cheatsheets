#!/bin/bash

pip install flask
pip install flask-wtf

export FLASK_APP=/path/to/module/file
export FLASK_DEBUG=1

flask run

app.config['SECRET_KEY'] = ''
import secrets
secrets.token_hex(16)

# From Corey Schafer
pip install flask
pip install flask-wtf
import secrets;secrets.token_hex(16)
pip install flask-sqlalchemy

# Flask SQLalchemy
db.create_all()
from app import db
from app import User, Pos

db.session.add(user_1)
db.session.commit()
db.session.rollback()

User.query.all()
User.query.first()
User.query.filter_by(username='ahmed').all()
User.query.filter_by(username='ahmed').first()
User.query.get(1)

user_1.posts

post_1.author

db.drop_all()

############################################################
############     RESTful API     ###########################
############################################################



