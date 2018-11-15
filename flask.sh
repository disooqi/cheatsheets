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
pip install flask-bcrypt
pip install flask-login

############################################################################
##################     Flask SQLalchemy     ################################
############################################################################
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

############################################################################
## The process of converting Flask project from module to a package ########
############################################################################
1. Create models.py and all the database models to it. Move all the relevant imported packeges to module
2. take care of the circular import; by converting flask app into package
    (a) create the package directory 
    (b) move every module into the new package except for the main module of flask app.py
    (c) initialize the flask application in the __init__.py module of the newly created packege 
    (d) move the importing of the DB modules to the end of the init module "from models import User, Post"
    (e) sparate the routes by moving all of them into their own module file named routes.py
    (f) within the runner module "app.py" import the app object from the package
 :
 :
 :
############################################################################
####### Hashing passwords and flask-bcrypt ########
############################################################################
pip install flask-bcrypt

from flask_bcrypt import Bcrypt
bcrypt = Bcrypt()
bcrypt.generate_password_hash('P@s$W0rd') # bytes
hashed_pwd = bcrypt.generate_password_hash('P@s$W0rd').decode('utf-8') # decode to text
bcrypt.check_password_hash(hashed_pwd, 'P@s$W0rd')

############################################################################
#######  User Authentication  ########
############################################################################
1. pip install flask-login
2. login_manager = LoginManager(app)
3. In models.py, define the following function
        (a)
        @login_manager.user_loader
        def load_user(user_id):
            return User.query.get(int(user_id))
        
        (b) from flask_login import UserMixin
4. In routes.py, 


############################################################################
#######  Dealing with Files  ########
############################################################################
1. In forms, add "from flask_wtf.file import FileField, FileAllowed"
2. Adding the following attribute to form element "enctype="multipart/form-data""

############################################################
############     RESTful API     ###########################
############################################################



