#!/bin/bash

pip install flask
pip install flask-wtf

export FLASK_APP=/path/to/module/file
export FLASK_DEBUG=1

flask run

app.config['SECRET_KEY'] = ''
import secrets
secrets.token_hex(16)
############################################################
############     RESTful API     ###########################
############################################################



