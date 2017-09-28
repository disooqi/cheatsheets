#!/bin/sh
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04

# Installing the Oracle JDK
# If you want to install the Oracle JDK, which is the official version distributed by Oracle, you will need to follow a few more steps.
# First, add Oracle's PPA, then update your package repository.
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# Oracle JDK 8
# This is the latest stable version of Java at time of writing, and the recommended version to install. You can do so using the following command:
sudo apt-get install oracle-java8-installer

# Oracle JDK 9
# This is a developer preview and the general release is scheduled for March 2017. It's not recommended that you use this version because there may still be security issues and bugs. There is more information about Java 9 on the official JDK 9 website.
# To install JDK 9, use the following command:
sudo apt-get install oracle-java9-installer

