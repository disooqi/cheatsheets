#!/bin/sh
# Please check https://conda.io/docs/user-guide/tasks/manage-environments.html for more details
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
conda env create


