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
pip install Pillow

############################################################################
##################     Flask SQLalchemy     ################################
############################################################################
from app import db
from app import User, Pos

db.create_all()

disooqi = User(fullname='Mohamed Eldesouki', email='disooqi@gmail.com', password='123', position='Research Associate',
            affiliation='Qatar Computing Research Associate', department='ALT', address='QCRI/Research Complex/HBKU/QF',
            telephone='+974-33542583')

db.session.add(disooqi)
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
3. In the routes.py, import os;import secrets
4. In the routes.py, 
    def save_picture(form_picture):
    random_hex = secrets.token_hex(8)
    _, picture_ext = os.path.splitext(form_picture.filename)
    picture_fn = random_hex + picture_ext
    picture_path = os.path.join(app.root_path, 'static', 'images', 'profile_pcs', picture_fn)
    form_picture.save(picture_path)
    return picture_fn
5. In the routes.py, 
    if form.validate_on_submit():
    if form.picture.data:
        picture_file = save_picture(form.picture.data)
        current_user.image_file = picture_file

############################################################
############     RESTful API     ###########################
############################################################


############################################################################
###################  Adding A field to a database  #########################
############################################################################

1) Add field to the Model 
        fullname = db.Column(db.String(50), nullable=False)
2) Drop the database and create a new one (for Relational DB)
3) Add field to the FlaskForm
4) Show the Field in the jinja2 template
5) update the field in the routes.py

############################################################################
################  Create the WSGI Entry Point  #############################
############################################################################
1) install either uWSGI or Gunicorn
2) Next, we'll create a file (wsgi.py) that will serve as the entry point for our application. 
    This will tell our Gunicorn server how to interact with the application. 
3) Create a systemd Unit File
        Create a unit file ending in .service within the /etc/systemd/system directory to begin: "sudo vim /etc/systemd/system/arabic-speech.service"
        sudo systemctl start myproject
        sudo systemctl enable myproject
4) Configuring Nginx to Proxy Requests
    sudo vim /etc/nginx/sites-available/myproject
    sudo ln -s /etc/nginx/sites-available/arabic-speech /etc/nginx/sites-enabled
    sudo nginx -t
    sudo systemctl restart nginx
5) 
