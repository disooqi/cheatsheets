#!/bin/sh
# it better to install scrapy from pip not from conda
pip install scrapy==1.4.0

# create a project as follows
# That will create a Scrapy project under the project_dir directory. 
# If project_dir wasn’t specified, project_dir will be the same as myproject.
scrapy startproject myproject [project_dir]

# Run the spider defined in the given file
# for option u can use "-o" direct output to json or plain file
scrapy runspider [options] <spider_file>

# Run a spider
scrapy crawl [options] <spider>

# Deploying and running Scrapy spiders to Scrapy Cloud
# https://www.youtube.com/watch?v=JYch0zRmcgU
pip install shub

# get the API key to login from the web site
shub login

# to deploy run the following and enter the project id
shub deploy 

# make sure that you run the same version of python on both your machine and scrapyinghub 
# you could control the python version using the file scrapinghub.yml in your project
projects:
  default:
    id: 234417
    stack: scrapy:1.4-py3
