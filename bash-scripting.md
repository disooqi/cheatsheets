## Some tutorial you might want to give a look
* https://www.amazon.com/Linux-Command-Shell-Scripting-Bible/dp/111898384X/ref=as_li_ss_tl?ie=UTF8&qid=1465646324&sr=8-4&keywords=bash+shell+scripting&linkCode=sl1&tag=nethta-20&linkId=9cc1bff704b553e6ce0632106784334f
* https://www.youtube.com/watch?v=tPKdfbL1Zv4&t=2904s
* https://stackoverflow.com/questions/209470/can-i-use-python-as-a-bash-replacement
* http://tldp.org/LDP/Bash-Beginners-Guide/html/
* http://linuxcommand.org/lc3_writing_shell_scripts.php
* https://www.linux.com/learn/writing-simple-bash-script
* https://explainshell.com/explain/1/ln


###   How to (safely) move /tmp to a different volume?

* https://unix.stackexchange.com/questions/5489/how-to-safely-move-tmp-to-a-different-volume/5503#5503
* https://linuxhint.com/lvm-ubuntu-tutorial/
* https://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
* https://wiki.ubuntu.com/Lvm
* https://unix.stackexchange.com/questions/282393/union-mount-on-linux#386758

```bash
{ cat /var/log/apache2/qatats.access.log.1 /var/log/apache2/qatats.access.log ; zcat /var/log/apache2/qatats.access.log.*.gz;} | grep "/farasa/requestExecuter.php" | cut -f1,4,9,10 -d' ' | grep " 200 "  > Farasa_usage_requests.txt

cat Farasa_usage_requests.txt Farasa_Downloads_requests.txt | cut -d' ' -f1 | sort | uniq | awk '{system("geoiplookup "$1" | grep Country ;echo "$1)}'  > Farasa_Country_lookup.txt
```

readlink -f `which command`<br />
Check whether Ubuntu OS architecture is 32-bit or 64-bit. 
```bash
file /sbin/init
file /lib/systemd/systemd
```

If you do not know the number of cores your processor, you can find it by typing
```bash
nproc

cat /etc/os-release
uname -a
lscpu
ln -fs <file_or_dir>
ln -s /etc/nginx/sites-available/dialectid /etc/nginx/sites-enabled

echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc
```

```bash
ps fx
awk '{print $1}' /var/log/nginx/access.log  | sort | uniq -c
date
```

```bash
# To find pids (process numbers) that are using /tmp

fuser -m /tmp
# stop or kill processes
ps -elf <pids>
```

```bash
ls -l, # which only displays the size of the individual files in a directory, nor
df -h  # which only displays the free and used space on my disks.


# To get the size of each dir in the in a specific dir use the following
du -h --max-depth=1 . | sort -hr # -h is to get the numbers "human readable", e.g. get 140M instead of 143260 (size in KBytes)

# To get the only the summary of the dir
du -hs /path/to/directory # -s is for summary (otherwise you'll get not only the size of the folder but also for everything in the folder separately) 

df -alkh /
sudo lsblk
```
## GREP
```bash
# This will find "some string" in /home/yourusername directory. The search will ignore case (-i) and recurse directories (-r). 
# You can use / as the directory to search in the whole directory but that might not be very efficient. 
grep -r -i SEARCHTERM /your/dir # search files within directory tree 
grep -i SEARCHTERM /etc/apt/sources.list # you can specify one file
grep -n SEARCHTERM file1 file2  # -n to show line number
```
## wget command
```bash
wget -O /tmp/model.tar.gz https://qcristore.blob.core.windows.net/public/asrlive/models/arabic/nnet3sac.tar.gz

# If you insert no -l option, wget will use -l 5 automatically.
wget -r --no-parent -A .ttl.bz2 -l 1 http://downloads.dbpedia.org/2016-10/core-i18n/en/
```
##  Navigating your Filesystem
```bash
pwd

ls -lah
cd <directory>
cd # just cd navigate to your home directory
```
##  Create, Copy, Move, Rename and Delete Files and Directories
```bash
mkdir <dir_name>
touch <file_name> # to create a file
open <file> # That's because open is a Mac specific command, it is not available under Linux (ubuntu),
xdg-open <file> # instead of open u can use xdg-open which does the same thing , irrespective of application i,e pdf, 
# image etc, it will open in new virtual terminal (i have tried this in linux)
cp <file> <new_file>
cp -R <directory> <new_dir>
# The -a option is an improved recursive option, that preserve all file attributes, and also preserve symlinks.
# The . at end of the source path is a specific cp syntax that allow to copy all files and folders, included hidden ones.
cp -a source/. dest/

mv <file> <new_name> # renaming a file
mv <file> <a_nother_dir>/ # move without renaming
mv <file> <a_nother_dir>/<new_name> # move and renaming
mv <directory> <new_dir> # renaming a directory
mv <dir>/ <a_nother_dir>/ # move without renaming
mv <dir>/ <a_nother_dir>/<new_dir_name> # move and renaming in the same time

rm [-f] <file>     # -f force a deletion
rm -R[f] <directory>
```

## find (compare with grep)
```bash
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
```
##  How To Use The cURL Command
```bash
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

curl [-i|--include] [-I|--head] [-N|--no-buffer]
[-H|--header] 'Accept: application/json; indent=4' 
[-F|--form] "name=content"
[--data|-d] ["para1=disooqi&para2=qcri"|'{"text": "حسبي الله ونعم الوكيل"}']
--data-urlencode ["para1=disooqi&para2=qcri"|'{"text": "حسبي الله ونعم الوكيل"}']
-X [PUT|DELETE|POST]
-u admin:password123
[--output|-o] live-online.gif https://dialectid.qcri.org/static/did/img/live-online.gif

--data-binary or --data-urlencode
http://127.0.0.1:8000/farasa/segmentation/v01/

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
```

##  How To Use The rsync Command - Sync Files Locally and Remotely
```bash
sync <dir>/* <packup_dir>/
rsync -r <dir>[/] <packup_dir>/ # recursive
rsync -a <dir>[/] <packup_dir>/ # a for archive it include the r option and also preserve the permissions and copy symlinks
rsync -av --dry-run <dir>[/] <packup_dir>/ # v for verpose
rsync -av --delete ..........  # it merrors both directory which means deleting extra files and dirs in the destination dir
rsync -zaP <local_source_dir> disooqi@dialectid.qcri.org:/home/django/django_project/ # z for compress P for progress
rsync -zaP disooqi@dialectid.qcri.org:/home/django/django_project/ <local_destination_dir>/
```
## SSH
Some references:
* https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server
* https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets
* https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

Create the RSA Key Pair (if there is one exist you could use it you don't need to make new one)
```bash
ssh-keygen -t rsa
ssh-keygen -t rsa -C "your_email@example.com"
ssh-keygen -t rsa -f cloud.key
```
On your local machine (not the VM), you will need to change key permissions with the chmod 400 <key name>.pem command in order to connect with this key.<br />
Refer to the private key you want to use:
```bash
ssh -i /path/where/your/key/is/my_key.key <user name>@<public IP of your server>
```

To copy the public key into the server, the .ssh folder should be 700 and authorized_keys file should be 600
```bash
cat ~/.ssh/id_rsa.pub | ssh [username]@[server.ip.address.here] "cat >> ~/.ssh/authorized_keys"
# or, use the following to automatically copy the public key
ssh-copy-id [username]@hostname
# or, if you don't have access using password you can run the following while you are in the root
rsync --archive --chown=[username]:[username] ~/.ssh /home/[username]
```

* https://serverfault.com/questions/221760/multiple-public-keys-for-one-user
  
### [Github SSH](https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories#switching-remote-urls-from-https-to-ssh)
For Github you need to 
```bash
# 1. Start the ssh-agent in the background 
eval "$(ssh-agent -s)"
# 2. and then Add your SSH private key to the ssh-agent. for example:
ssh-add ~/.ssh/id_ed25519
# 3. Switching remote URLs from HTTPS to SSH
git remote set-url origin git@github.com:disooqi/REPOSITORY.git
git remote -v  # to verify
```
Tunnel
```bash
ssh -L 8888:localhost:8888 qcri@qatslive4520.cloudapp.net
```

##  How To Use The scp Command - copy Files Locally and Remotely
```bash
# http://www.hypexr.org/linux_scp_help.php
# Copy the file "foobar.txt" from a remote host to the local host
scp your_username@remotehost.edu:foobar.txt /some/local/directory

# Copy the file "foobar.txt" from the local host to a remote host
scp foobar.txt your_username@remotehost.edu:/some/remote/directory

scp -i <some.key> # use -i flag to provide a private key, if you want to access using ssh

# Copy the directory "foo" from the local host to a remote host's directory "bar"
scp -r foo your_username@remotehost.edu:/some/remote/directory/bar

#  Using the Blowfish cipher has been shown to increase speed.
# It is often suggested that the -C option for compression should also be used to increase speed
scp -c blowfish -C local_file your_username@remotehost.edu:~
```

## Compression
* https://www.digitalocean.com/community/tutorials/an-introduction-to-file-compression-tools-on-linux-servers
* Using Tar Archiving with different Compression Tools i.e. gzip, bzip2, xz



### Using TAR with gzip
```bash
tar czvf <target_name>.tar.gz  <source_directory_name>

# c for achive
# z for 'use gzip for compression'
# v for verbose
# f for file 'must come in the end'

tar tzvf <compressed_file_name>.tar.gz

# to for peeking inside the compressed file


tar xzvf <compressed_file_name>.tar.gz [-C /where/do/you/want/to/extract/] [--strip-components=1]

# x for extract using gzip
```

### Using TAR with bzip2


* For using bzip2 you can just repalce the z flag with the j flag.
```bash
tar cjvf <target_name>.tar.bz2  <source_directory_name>
tar tjvf <compressed_file_name>.tar.bz2
tar xjvf <compressed_file_name>.tar.bz2
```


### Using TAR with xz
* for using xz you can just use the J flag instead of the z or j flags
```bash
tar cJvf <target_name>.tar.xz  <source_directory_name>
tar tJvf <compressed_file_name>.tar.xz
tar xJvf <compressed_file_name>.tar.xz
```
* To extract an archive to a directory different from the current, use the -C, or --directory, tar option, as in
```bash
tar -x**f archive.tar -C /target/directory
```
* https://askubuntu.com/questions/854201/unable-to-unzip-to-opt-directory
```bash
sudo unzip -d /opt/ jstock-1.0.7.17-bin.zip
```

### Useful Commands
  
  ```bash
  # List open files 
  sudo lsof
  
  # shows the list of all network connections LISTENING & ESTABLISHED
  lsof -i
  
  # List open ports (-i option to filter for a specific port, -P just return port number; no port names)
  sudo lsof -i :6075 -P 
  
  # To return processes that listen on a specific port use -t flag 
  sudo lsof -i :6075 -P -t 
  
  # To kill all processes listening on a specific port use
  # If the process is more persistent, and kill did not work, try `kill -9` to kill it more aggressively.
  lsof -ti tcp:6075 | xargs kill
  
  # To list all the running process of open files of TCP Port ranges from 1-1024
  lsof -i TCP:1-1024
  
  # By user
  lsof -u disooqi
  lsof -u^disooqi
  lsof -i -u disooqi
  ```

### Screen
```bash
screen -dmS app_server_core sh
screen -S app_server_core -p 0 -X stuff "cd diacritize_core_python/
"
screen -S app_server_core -p 0 -X stuff "python app_server_core.py
"

screen -ls

screen -X -S [session_no you want to kill] kill
# "kill" will only kill one screen window. To "kill" the complete session, use quit.
screen -X -S [session_no you want to kill] quit

# to attach to already attached screen
screen -d -r <screen>
```

### sed
```bash
sudo sed -i '2d' /etc/apt/sources.list # you can remove line 2 using your favorite editor or use sed:
sudo sed -i '2 s/^/# /' /etc/apt/sources.list # comment out the 2nd line:
```

### tail
```bash
  sudo tail -f /var/log/apache2/access.log
```
  
### update-alternatives
```bash
  ls -l /etc/alternatives

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0.05/bin/java 1
sudo update-alternatives --install /usr/bin/java java ${JAVA_HOME%*/}/bin/java 20000
sudo update-alternatives --install /usr/bin/javac javac ${JAVA_HOME%*/}/bin/javac 20000

sudo update-alternatives --config java
sudo update-alternatives --config javac

sudo update-alternatives --remove java ${JAVA_HOME%*/}/bin/java

sudo update-alternatives --remove-all java
```
  
#############################################################
https://linoxide.com/linux-how-to/few-command-helps-to-get-linux-hardware-details/

##########################################################################
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

####################################
#### get linux hardware details
#####################################3
https://linoxide.com/linux-how-to/few-command-helps-to-get-linux-hardware-details/
