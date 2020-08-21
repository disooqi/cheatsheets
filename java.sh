#!/bin/sh

##########################################################################################################
#############################################  THIS IS IT  ###############################################
### https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04#installing-oracle-jdk-11
### https://www.fosstechnix.com/install-oracle-java-8-on-ubuntu-20-04/
### JAVA_HOME vs update-alternatives
### https://unix.stackexchange.com/questions/123412/what-is-the-difference-between-java-home-and-update-alternatives
### https://stackoverflow.com/questions/41059994/default-java-java-home-vs-sudo-update-alternatives-config-java
### 
##########################################################################################################
##########################################################################################################

wget  --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie"  https://download.oracle.com/otn-pub/java/jdk/13.0.1+9/cec27d702aa74d5a8630c65ae61e4305/jdk-13.0.1_linux-x64_bin.tar.gz
## Go to https://www.oracle.com/technetwork/java/javase/downloads/index.html
## Download jdk-xxx.xx.xx_linux-x64_bin.tar.gz 
## Extract it here
sudo tar xzvf jdk-13.0.1_linux-x64_bin.tar.gz -C /opt/


# copy the following to set JAVA_HOME in file /etc/environment 
JAVA_HOME="/opt/jdk-xx.xx.xx"

# and then 
source /etc/environment
echo $JAVA_HOME

##  https://java.com/en/download/help/linux_x64_install.xml

# OPTION 1
#============
# Then, copy the following to ~/.bashrc
source /etc/environment
export PATH=$PATH:$JAVA_HOME/bin

# and then 
source ~/.bashrc


# OPTION 2
#============
sudo update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
sudo update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000
sudo update-alternatives --install /usr/bin/javaws javaws ${JAVA_HOME%*/}/bin/javaws 20000

sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws


# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04

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


# https://www.youtube.com/watch?v=VrOhA-I3aFs

# set environment variable JAVA_HOME
sudo vim /etc/environment
source /etc/environment

# to know the where did you install your sdk
readlink -f  `which javac`
dirname `dirname "the-output of last line"`

CATALINA_HOME="/home/disooqi/apache-tomcat-8.0.27"
