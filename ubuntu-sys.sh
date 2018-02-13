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

