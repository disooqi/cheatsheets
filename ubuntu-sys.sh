#! /bin/bash
lscpu
# https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-ubuntu-16-04-lts

ln -fs <file_or_dir>


 ls -l, which only displays the size of the individual files in a directory, nor
 df -h, which only displays the free and used space on my disks.
    
 du -hs /path/to/directory
 #   -h is to get the numbers "human readable", e.g. get 140M instead of 143260 (size in KBytes)
 #   -s is for summary (otherwise you'll get not only the size of the folder but also for everything in the folder separately)



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


###########################################################################
#######################  Navigating your Filesystem  ######################
###########################################################################
pwd

ls -la
cd <directory>
cd # just cd navigate to your home directory

###########################################################################
######  Create, Copy, Move, Rename and Delete Files and Directories  ######
###########################################################################
mkdir <dir_name>
touch <file_name> # to create a file
open <file> # That's because open is a Mac specific command, it is not available under Linux (ubuntu),
xdg-open <file> # instead of open u can use xdg-open which does the same thing , irrespective of application i,e pdf, 
# image etc, it will open in new virtual terminal (i have tried this in linux)
cp <file> <new_file>
cp -R <directory> <new_dir>

mv <file> <new_name> # renaming a file
mv <file> <a_nother_dir>/ # move without renaming
mv <file> <a_nother_dir>/<new_name> # move and renaming
mv <directory> <new_dir> # renaming a directory
mv <dir>/ <a_nother_dir>/ # move without renaming
mv <dir>/ <a_nother_dir>/<new_dir_name> # move and renaming in the same time

rm [-f] <file>     # -f force a deletion
rm -R[f] <directory>

