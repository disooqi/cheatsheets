#!/bin/sh
###########################################################
########### This is a 1.8.7 version commands  #############
###########################################################

# https://simpleisbetterthancomplex.com/tutorial/2016/10/14/how-to-deploy-to-digital-ocean.html
# https://www.digitalocean.com/community/tutorials/how-to-use-the-django-one-click-install-image-for-ubuntu-16-04
# https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-16-04
 
# Create Project
django-admin startproject <project_name>

# Start server
python manage.py runserver 0.0.0.0:8000


python manage.py startapp <app_name>

# Activating models
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    '<app_name>',
)

# By running makemigrations, you’re telling Django that you’ve made some changes to your models (in this case, you’ve 
# made new ones) and that you’d like the changes to be stored as a migration.
python manage.py makemigrations <app_name>

 # run the migrations for you and manage your database schema automatically
 python manage.py migrate
