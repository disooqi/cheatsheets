#!/bin/sh
# it better to install scrapy from pip not from conda
pip install scrapy==2.10.1

# create a project as follows
# That will create a Scrapy project under the project_dir directory. 
# If project_dir wasn’t specified, project_dir will be the same as myproject.
scrapy startproject myproject [project_dir]

# Run the spider defined in the given file
# for option u can use "-o" direct output to json or plain file
scrapy runspider [options] <spider_file>

# Run a spider
scrapy crawl [options] <spider>

# To try out selectors to extract data with Scrapy use the following:
scrapy shell 'http://quotes.toscrape.com/page/1/'

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

## to check uptodate stacks
https://hub.docker.com/r/scrapinghub/scrapinghub-stack-scrapy/tags
https://github.com/scrapinghub/scrapinghub-stack-scrapy/tree/branch-2.10
https://support.zyte.com/support/solutions/articles/22000200402-changing-the-deploy-environment-with-scrapy-cloud-stacks
