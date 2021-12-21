```bash
sudo apt update
sudo apt full-upgrade
```
It’s worth checking with df -h that you have enough free disk space.<br />
Also be aware that downloaded package files (.deb files) are kept in `/var/cache/apt/archives`. You can remove these in order to free up space 
with sudo `apt clean` (`sudo apt-get clean` in older releases of apt). 

