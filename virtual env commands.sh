#!/bin/sh

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




