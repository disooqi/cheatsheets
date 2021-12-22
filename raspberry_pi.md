A good documentation for your raspberry Pi _OS_ is found here: https://www.raspberrypi.com/documentation/computers/os.html <br />
A good documentation for your raspberry Pi _camera_ is found here: https://www.raspberrypi.com/documentation/accessories/camera.html#camera-modules <br />


```bash
sudo apt update
sudo apt full-upgrade
```
It’s worth checking with df -h that you have enough free disk space.<br />
Also be aware that downloaded package files (.deb files) are kept in `/var/cache/apt/archives`. You can remove these in order to free up space 
with sudo `apt clean` (`sudo apt-get clean` in older releases of apt). 

The following companies are all Raspberry Pi Approved Resellers in Canada.
* [CanaKit](https://www.canakit.com/)
* [PiShop](https://www.pishop.ca/)

## Hotword and Wake Word Detection
* [Picovoice](https://github.com/Picovoice/porcupine)
* [pocketsphinx](https://github.com/cmusphinx/pocketsphinx)
* [snowboy](https://github.com/seasalt-ai/snowboy)
