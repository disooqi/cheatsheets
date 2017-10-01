#!/bin/sh
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04

# Make sure you're in your home directory
cd ~
# making sure to replace 6.x with the correct version string for example 6.11.3
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
# And run the script under sudo:
sudo bash nodesource_setup.sh

sudo apt-get install nodejs
