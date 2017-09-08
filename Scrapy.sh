#!/bin/sh
# it better to install scrapy from pip not from conda
pip install scrapy==1.4.0

# create a project as follows
# That will create a Scrapy project under the project_dir directory. 
# If project_dir wasn’t specified, project_dir will be the same as myproject.
scrapy startproject myproject [project_dir]
