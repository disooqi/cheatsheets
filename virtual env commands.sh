#!/bin/sh
# Please check https://conda.io/docs/user-guide/tasks/manage-environments.html for more details

################
## virtualenv ##
################

# to install virtualenv
pip install virtualenv

# to list all the packages installed inside the env that you are in
pip list

# try to put all your environments in one directory

# to create an environment run the following command:
virtualenv <env_name>

# to activate the environment just run 
source <env_name>/bin/activate


virtualenv venv --python=python2.7

# Thanks to a comment, this only works if you have python2.7 installed at the system level (e.g. /usr/bin/python2.7).
# Otherwise, if you are using homebrew you can use the path to give you what you want.
virtualenv venv --python=/usr/local/bin/python
virtualenv venv --python=/usr/local/bin/python3

# Ultimately condensing to:
virtualenv venv -p `which python`
virtualenv venv -p `which python3`conda env create
virtualenv -p `which python2.6` <path/to/new/virtualenv>
virtualenv -p python3 <myenvname>

# For Python3.6, the below pyvenv script is deprecated. 
pyvenv /path/to/new/virtual/environment
# Instead, it is suggested that you create the virtual environment with the following command:
# [SOF] https://stackoverflow.com/questions/1534210/use-different-python-version-with-virtualenv/39713544#39713544
python3 -m venv <myenvname>
#or 
python 3 -m venv <myenvname>

# to export the environemnt 
pip freeze --local > requirements.txt

# The requirements.txt file just contains the python packages installed in the env but it does not 
# specify the python version, so
# To use the requirements.txt you need first to create env as mentioned above and then use the followinf command to 
# reinstall the packages in the env.
pip install -r requirements.txt

# close env by 
deactivate

# To delete an env, you need just deactivated and then run the following:
rm -rf <myenvname>

################
### Anaconda ###
################

# conda is used to install non-python packages and dependencies 
conda --help
conda list

# conda is also used to manage your environment too
# new env using conda

conda create --name <env_name> <[list of package to be installed with the env]>

# activate env
source activate <env_name> 
source deactivate <env_name>

# save the environment using the following command
conda env export > environment.yml

# if you want to recreate the environment run the following
# it requires that you are in the same directory of file environment.yml and the name of the file should either has the name of "environment.yml" or "environment.yaml"
conda env create [-f <filename>]


# To delete an environement just run
conda remove --name <env_name> --all


