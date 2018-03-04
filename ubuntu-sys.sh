#! /bin/bash
lscpu
# https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-ubuntu-16-04-lts

ln -fs <file_or_dir>

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
###########################################################################
#####################  Nvidia driver for the ZBook  #######################
###########################################################################
# Download the driver the following link:
# http://www.nvidia.com/download/driverResults.aspx/130646/en-us

sudo vim /etc/modprobe.d/blacklist-nouveau.conf # /etc/modprobe.d/nvidia-installer-disable-nouveau.conf

# and write the following:
blacklist nouveau
options nouveau modeset=0

# save and run
sudo update-initramfs -u

# and then reboot then hit Ctrl+Alt+F1 and login using your credentials
# kill your current X server session by typing 
sudo service lightdm stop

sudo bash your-nvidia-driver.run


