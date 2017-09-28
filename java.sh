#!/bin/sh
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04

# Installing the Oracle JDK
# If you want to install the Oracle JDK, which is the official version distributed by Oracle, you will need to follow a few more steps.
# First, add Oracle's PPA, then update your package repository.
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
