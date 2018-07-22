#!/bin/sh
# https://www.amazon.com/Linux-Command-Shell-Scripting-Bible/dp/111898384X/ref=as_li_ss_tl?ie=UTF8&qid=1465646324&sr=8-4&keywords=bash+shell+scripting&linkCode=sl1&tag=nethta-20&linkId=9cc1bff704b553e6ce0632106784334f
# https://www.youtube.com/watch?v=tPKdfbL1Zv4&t=2904s
# https://stackoverflow.com/questions/209470/can-i-use-python-as-a-bash-replacement

# http://tldp.org/LDP/Bash-Beginners-Guide/html/
# http://linuxcommand.org/lc3_writing_shell_scripts.php
# https://www.linux.com/learn/writing-simple-bash-script
lscpu
ln -fs <file_or_dir>

echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc

############################################################################################
lsof -i :8080
# COMMAND  PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# java    8445 disooqi   83u  IPv6  76005      0t0  TCP localhost:http-alt (LISTEN)

kill -9 8135
##############################################################################################
 ls -l, which only displays the size of the individual files in a directory, nor
 df -h, which only displays the free and used space on my disks.
    
 du -hs /path/to/directory
 #   -h is to get the numbers "human readable", e.g. get 140M instead of 143260 (size in KBytes)
 #   -s is for summary (otherwise you'll get not only the size of the folder but also for everything in the folder separately)

## SCP
####################
# http://www.hypexr.org/linux_scp_help.php


# This will find "some string" in /home/yourusername directory. The search will ignore case (-i) and recurse directories (-r). 
# You can use / as the directory to search in the whole directory but that might not be very efficient. 
grep -r -i "some string" /home/yourusername

###########################################################################
#######################  Navigating your Filesystem  ######################
###########################################################################
pwd

ls -lah
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

###########################################################################
######################  How To Use The find Command  ######################
###########################################################################
find . # find all the files and dirs below the current one
find <dir> # find all the files and dirs below a specific dir
find . -type d # find all the dirs and exclude files
find . -type f # find all the files and exclude dirs
find . -type f -name "name u searching for *"
find . -type f -iname "name u searching for *" # -iname to make it insensitive 
find . -type f -mmin [-|+]10 # to find all files modified less - or + more than 10 min
find . -type f -mmin -10 -mmin +1 # within 1 and 10 min
find . -type f -mtime -20 # less than 20 days ago
# mmin and mtime for modified times and amin and atime for access time and cmin and ctime to change min and days
find . -size +5[M|k|G]
find . -empty
find . -perm 777
find . -perm 777 -exec chown disooqi:django {} [+|\;]
find . -perm 777 -exec chown disooqi:django {} [+|\;]
find . -type d -exec chmod 775 {} +
find . -type f -name "*.txt" -maxdepth 1 -exec rm {} +

###########################################################################
######################  How To Use The cURL Command  ######################
###########################################################################
# cURL Command alows us to query URLs from the command line
curl mohamed-eldesouki.com
curl -i mohamed-eldesouki.com
curl [--data|-d] "para1=disooqi&para2=qcri" mohamed-eldesouki.com
curl -X [PUT|DELETE] [--data|-d] "para1=disooqi&para2=qcri" mohamed-eldesouki.com
curl -u disooqi:P@s$w0rD  mohamed-eldesouki.com
curl [--output|-o] live-online.gif https://dialectid.qcri.org/static/did/img/live-online.gif
# http://www.thenerdary.net/post/24889968081/debugging-websockets-with-curl
curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: echo.websocket.org" -H "Origin: http://www.websocket.org" http://echo.websocket.org
curl -X POST https://farasa-api.qcri.org/farasa/webapi/segmenter -H 'content-type: application/json' -d '{"text": "حسبي الله ونعم الوكيل"}'
###########################################################################
#####  How To Use The rsync Command - Sync Files Locally and Remotely  ####
###########################################################################
rsync <dir>/* <packup_dir>/
rsync -r <dir>[/] <packup_dir>/ # recursive
rsync -a <dir>[/] <packup_dir>/ # a for archive it include the r option and also preserve the permissions and copy symlinks
rsync -av --dry-run <dir>[/] <packup_dir>/ # v for verpose
rsync -av --delete ..........  # it merrors both directory which means deleting extra files and dirs in the destination dir
rsync -zaP <local_source_dir> disooqi@dialectid.qcri.org:/home/django/django_project/ # z for compress P for progress
rsync -zaP disooqi@dialectid.qcri.org:/home/django/django_project/ <local_destination_dir>/

###########################################################################
#####  How To Use The scp Command - copy Files Locally and Remotely  ####
###########################################################################
# http://www.hypexr.org/linux_scp_help.php
# Copy the file "foobar.txt" from a remote host to the local host
scp your_username@remotehost.edu:foobar.txt /some/local/directory

# Copy the file "foobar.txt" from the local host to a remote host
scp foobar.txt your_username@remotehost.edu:/some/remote/directory

# Copy the directory "foo" from the local host to a remote host's directory "bar"
scp -r foo your_username@remotehost.edu:/some/remote/directory/bar

#  Using the Blowfish cipher has been shown to increase speed.
# It is often suggested that the -C option for compression should also be used to increase speed
scp -c blowfish -C local_file your_username@remotehost.edu:~












