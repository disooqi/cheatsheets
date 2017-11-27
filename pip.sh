#!/bin/sh

# installing pip
sudo apt install python-pip

# update pip
pip install --upgrade pip
# -U, --upgrade Upgrade all packages to the newest available version
# So, if you already have a package installed, it will upgrade the package for you. 
#Without the -U switch it'll tell you the package is already installed and exit.

# Each pip subcommand has it's own help listing. pip -h shows you overall help, and pip [subcommand] -h gives you help for that 
# sub command, such as install.

# upgrading a package
pip install --upgrade <package_name> 

# 
pip install --no-cache-dir <package_name> 

# pip-install-a-specific-github-repo-tag-or-branch
# https://coderwall.com/p/-wbo5q/pip-install-a-specific-github-repo-tag-or-branch


