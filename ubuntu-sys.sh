#! /bin/bash
lscpu
# https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-ubuntu-16-04-lts

########################################
###### First-time installation #########
########################################
# pycharm
sudo tar xf <pycharm-professional or pycharm-community>-*.tar.gz -C /opt/
cd /opt/<pycharm-professional or pycharm-community>/bin
bash pycharm.sh

# bootable USB to install Window 
# https://help.ubuntu.com/community/mkusb#Windows_USB_install_drive

https://antonyagnel.com/2016/09/18/things-to-do-after-installing-ubuntu-16-04-lts/

# On newer systems running systemd (e.g. Ubuntu 16.04), you should use:
sudo hostnamectl set-hostname new-name


###########################################################################
###############  Initial Server Setup with Ubuntu 16.04  ##################
###########################################################################
adduser disooqi
usermod -aG sudo disooqi
su - disooqi

mkdir ~/.ssh
chmod 700 ~/.ssh
sudo vim ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys




