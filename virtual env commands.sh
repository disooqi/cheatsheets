#!/bin/sh

################
#### pyenv ####
################
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

exec "$SHELL"

sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# If you wanted to see all the available CPython 3.6 through 3.8, you can do this:
pyenv install --list | grep " 3\.[678]"

pyenv install 3.7.6

pyenv global 3.7.6

# The 'versions' command displays all currently installed Python versions:
pyenv version


################
#### Pipenv ####
################
# Installing pipenv 
pip install --user pipenv # sudo -H pip install -U pipenv


# If you don’t even have pip installed, you can use this crude installation method, which will bootstrap your whole system:
curl https://raw.githubusercontent.com/pypa/pipenv/master/get-pipenv.py | python

# To store your virtualenv inside your project directory

echo 'export PIPENV_VENV_IN_PROJECT=1' >> ~/.bashrc

export PIPENV_CACHE_DIR=""

# To create or update existed ENV for "pipfile"
# Be ware of this issue https://github.com/pypa/pipenv/issues/1914#issuecomment-429515521 and use --skip-lock
pipenv install [--python 3.8]
pipenv  install -v --skip-lock allennlp==0.9.0 --python 3.7


# For production 
pipenv install --ignore-pipfile

# To get the DIR of the virtual env
pipenv --venv

# To install packages from an old requirements.txt file this will create an ENV if does not exist
pipenv install -r ../the/path/to/your/requirements.txt

# To delete an ENV 
pipenv --rm

# To activate the environment
pipenv shell

# To deactivate an environment
exit

# To install a package (use the --dev flag only if you want packages installed only for dev environment)
pipenv install <package_name> [--dev]

pipenv uninstall <package_name> [--dev]

# To install packages from an old requirements.txt file
pipenv install -r ../the/path/to/your/requirements.txt

# To run a python script without activating the virtual environment.
pipenv run python <my_script.py>

# To run the interactive python of an ENV without activating it
pipenv run python

# To generate requirements.txt file to distribute it with your project so people who still use virtualenv can generate 
# the same env:
pipenv lock -r

# To update pipfile.lock
pipenv lock

# Create .env file for your environement variables
#SECRET_KEY="fgfm4534kfdgdklnml5498"


# if you already have an old virtual env created using `virtualenv` command and you want to use it with pipenv, do the 
# following:
# 1) Activate the old environment, then 
# 2) run sh`pipenv install`

# It’s worth adding the Pipfiles to your Git repository, so that if another user were to clone the repository, all they would
# have to do is install Pipenv on their system and then type,
pipenv install

######################################################
################ virtualenv ##########################
######################################################

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
# Please check https://conda.io/docs/user-guide/tasks/manage-environments.html for more details
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
# it requires that you are in the same directory of file environment.yml and the name of the file should either has 
# the name of "environment.yml" or "environment.yaml"
conda env create [-f <filename>]


# To delete an environement just run
conda remove --name <env_name> --all

#####################################################################
#####################################################################

# You have chosen to not have conda modify your shell scripts at all. 
# To activate conda's base environment in your current shell session:
eval "$(/home/disooqi/miniconda2/bin/conda shell.YOUR_SHELL_NAME hook)"
# To install conda's shell functions for easier access, first activate, then:
conda init
# If you'd prefer that conda's base environment not be activated on startup,  
# set the auto_activate_base parameter to false:  
conda config --set auto_activate_base false
# Thank you for installing Miniconda2! 


######################################################################
Using venv module
######################################################################
In Windows
----------
# Create environemnt
python -m venv env

# Activate environment
env\Scripts\activate.bat

# Update pip 
python -m pip install --upgrade pip

# Create requirements.txt file
pip freeze  # copy the output from the screen and past it into a file

# Deactivate our environment 
deactivate

# delete our environment 
rmdir env /s
