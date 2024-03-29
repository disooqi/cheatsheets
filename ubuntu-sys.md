
# First Time Ubuntu

1. Install [pyenv](https://github.com/pyenv/pyenv)

2. Install virtual invironment, one othe following
   a) Poetry (Recommended)
   b) Pipenv
   c) Conda
   d) Virtualenv (native)

4. Install IDE, choose between:
   a) PyCharm
   b) VS Code
   c) VIm
   d) IDX

## Creating Projects
There are many ways to initiate your project. I am going to mension those only that I use:
1. For generic Python projects, `poetry new` (for already existed projects `poetry init`)
   You can always your IDE to automatically initiate both you project and your virtual environment.
3. For Scrapy projects, `scrapy startproject project-name [.]`
4. For Django projects, `django-admin startproject mysite`

## Creating Virtual Environemnt
I usually prefer to reside the project's virtual environment within the project directory. 
As a good practice, the environment sub-directory should start with a `dot` to hide it and added
it to the `.gitignore` file.

In Poetry, either creating a new project or intializing and existing one, poetry will prompt you with the process of adding you dependency packages. If you choose to use this wizard to add the packages, then all you need is to run `poetry install` to create the environment. Poetry will automatically create  the environemnt if start adding packages to you project via `poetry add <package-name>` and create the
`poetry.lock` file.

### Creating an env fron already existed `pyproject.toml` file
To create an environment usuing Poetry use `poetry install` command and if the 


https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-ubuntu-20-04-focal-fossa

```bash
sudo apt update && sudo apt upgrade
sudo apt install curl
sudo apt-get install git-all
sudo apt install vim 
```

## Install zsh
```bash
sudo apt install zsh
chsh -s $(which zsh)
```
* logout and login to create the .zshrc file
* Test that it worked with echo $SHELL. Expected result: /bin/zsh or similar.
* Install Oh My Zsh and configuring .zshrc
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install fonts-powerline # for theme agnoster to work fine
echo 'ZSH_THEME="agnoster"' >> .zshrc
echo 'DEFAULT_USER=`whoami`' >> .zshrc
```
In the .zshrc file, edit `plugins=(git bundler dotenv rake rbenv pyenv python pipenv ruby)`. Make sure that to 
export pyenv before listing your plugins to get rid of the error.

## Install starship
```sh
sudo snap install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```
It is a good idea to comment out the ZSH_THEME entry in ~/.zshrc

## Install Dracula Theme (gnome-terminal+gtk)
* https://draculatheme.com/gnome-terminal
* https://draculatheme.com/gtk
```sh
sudo apt install gnome-tweaks
```
## Other Terminal Emulators
* [Kitty](https://sw.kovidgoyal.net/kitty/) - The fast, feature-rich, GPU based terminal emulator
* [Tabby](https://tabby.sh/) - A terminal for the modern age

### [Installing the NVIDIA Drivers Using the Command-Line](https://linuxize.com/post/how-to-nvidia-drivers-on-ubuntu-20-04/)
Run the following command to get information about your graphic card and available drivers:
```bash
ubuntu-drivers devices
```
The output will shows the model of the system (e.g. "GeForce GTX 1650") and the recommended driver to install (e.g. "nvidia-driver-470") among other drivers you can install. You may see a different output depending on your system.<br />
<br />
Choose the recommended driver and run the following:

```bash
sudo apt install nvidia-driver-440
sudo reboot
```
When the system is back, you can view the status of the graphic card using the `nvidia-smi` monitoring tool:
```bash
nvidia-smi
```

```bash
########################################
######  Removing A package  ############
########################################
ps -aux | grep mq
ps -eaf | grep erl

# find all related packages
dpkg -l | grep postgres

# delete with --purge
sudo apt --purge remove postgresql-client-12 postgresql postgresql-contrib

# OR 
sudo apt-get remove --auto-remove rabbitmq-server
sudo apt-get purge --auto-remove rabbitmq-server

# also look inside:
ls -la /etc/apt/sources.list.d

########################################
###### First-time installation #########
########################################
#jet-brains toolbox 
1  sudo tar -xzf Downloads/jetbrains-toolbox-1.16.6016.tar.gz -C /opt
2  cd /opt/jetbrains-toolbox-1.16.6016/
3  bash jetbrains-toolbox 
4  ./jetbrains-toolbox

# pycharm
sudo tar xf <pycharm-professional or pycharm-community>-*.tar.gz -C /opt/ [--strip-component]
cd /opt/<pycharm-professional or pycharm-community>/bin
bash pycharm.sh

# Unpack the .zip file you downloaded to an appropriate location for your applications, such as within /usr/local/ for 
# your user profile, or /opt/ for shared users.

# bootable USB to install Window 
# https://help.ubuntu.com/community/mkusb#Windows_USB_install_drive

https://antonyagnel.com/2016/09/18/things-to-do-after-installing-ubuntu-16-04-lts/

# On newer systems running systemd (e.g. Ubuntu 16.04), you should use:
sudo hostnamectl set-hostname new-name


ssh-keygen -t rsa -f cloud.key

# Install Eclipse, https://websiteforstudents.com/how-to-install-eclipse-oxygen-ide-on-ubuntu-167-04-17-10-18-04/
# Step 1: Install Java JDK 
# Step 2: Download Eclipse; something like eclipse-inst-linux64.tar.gz
# Step 3: Install Eclipse IDE
sudo tar -xzf ~/Downloads/eclipse-inst-linux64.tar.gz -C /opt
# run 
/opt/eclipse-installer/eclipse-inst
# Create Eclipse App Launcher
vim .local/share/applications/eclipse.desktop

###########################################################################
###############  Initial Server Setup with Ubuntu 16.04  ##################
###########################################################################
adduser disooqi
usermod -aG sudo disooqi

sudo useradd -U -m -G sudo -s /bin/bash lorisadmin

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
############################################################################
sudo apt update 
sudo apt install nvidia-384

###########################################################################
#######################  remove PPA repository  ###########################
###########################################################################
sudo apt-get intall ppa-purge
sudo ppa-purge ppa:<your package>/ppa

# or 
# search for 'software & update' and choose 'Other Software' tap
# and then remove the ppa you want.

##############################################################################
###################### Ubuntu-Windows Dual Boot ##############################
##############################################################################
Found Windows Boot Manager on /dev/nvme0n1p1@/EFI/Microsoft/Boot/bootmgfw.efi

###############################################################
###################### SWAP file ##############################
###############################################################

# For swap size in Ubuntu: https://itsfoss.com/swap-size/
# https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-18-04


sudo fallocate -l  1G /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile # to be readable only by the root
sudo mkswap /swapfile
sudo swapon /swapfile
# edit file /etc/fstab to add this [/swapfile swap swap defaults 0 0]
sudo vim /etc/fstab
sudo mount -a # do this after reboot to make sure there no misspellings in there
```
