A good documentation for your raspberry Pi _OS_ is found here: https://www.raspberrypi.com/documentation/computers/os.html <br />

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

## GPIO Tutorial
* [Pins – Complete Practical Guide](https://roboticsbackend.com/raspberry-pi-3-pins/)
* [Introduction to WiringPi](https://roboticsbackend.com/introduction-to-wiringpi-for-raspberry-pi/)
* []()
* []()


## [How to setup a static IP address?](https://thepihut.com/blogs/raspberry-pi-tutorials/16683276-how-to-setup-a-static-ip-address-on-your-raspberry-pi)
1. edit /etc/network/interfaces

## Developing on the PI
If installing an new virtual environment, don't forget to include `--system-site-packages` to consider some dependencies like GPIO.<br />
<s>If you already created the virtualenv, you can enable them by deleting following file:
your_venv_dir/lib/pythonXXX/no-global-site-packages.txt</s><pr />

After creating a new project in PyCharm you can use SSH to develop directly on the Pi.
1. Go to settings -> Python Interpreter -> Add -> choose 'SSH Interpreter'
2. Enter your server information i.e IP, port, password 
3. For Deployment Configuration, Go to settings -> Python Interpreter -> Show All -> Edit (the chosen Interpreter)
4. Choose the the three dots '...' next to Deployment Configuration and choose the Mappings tap and change the Deployment path


* [Configure Vim](https://roboticsbackend.com/install-use-vim-raspberry-pi/) to work on RPi


## Interrupts Tutorial
* https://roboticsbackend.com/raspberry-pi-gpio-interrupts-tutorial/

## Start Program on Booting
* https://roboticsbackend.com/make-a-raspberry-pi-3-program-start-on-boot/
* https://www.dexterindustries.com/howto/run-a-program-on-your-raspberry-pi-at-startup/

## Using Camera
* https://roboticsbackend.com/raspberry-pi-camera-picamera-python-library/
* A good documentation for your raspberry Pi _camera_ is found here: https://www.raspberrypi.com/documentation/accessories/camera.html#camera-modules

## Mounting a Storage Device to your Raspberry Pi
You can mount your storage device at a specific folder location. It is conventional to do this within the /mnt folder, for example /mnt/mydisk. Note that the folder must be empty.<br>
Plug the storage device into a USB port on the Raspberry Pi.<br>

List all the disk partitions on the Pi using the following command:
```bash
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
```
If your storage device uses an NTFS file system, you will have read-only access to it. If you want to write to the device, you can install the ntfs-3g driver:
```bash
sudo apt install ntfs-3g
```
Run the following command to get the location of the disk partition:
```bash
sudo blkid  # for example /dev/sda1
```
Create a target folder to be the mount point of the storage device. The mount point name used in this case is mydisk. You can specify a name of your choice:
```bash
sudo mkdir /mnt/My_Passport_07A8
```
Mount the storage device at the mount point you created:
```bash
sudo mount /dev/sda1 /mnt/my_passport
```

To setting up Automatic Mounting, get UUID of the storage device using `sudo blkid`. Then, modify the `fstab` file to define the location where the storage device will be automatically mounted when the Raspberry Pi starts up.
```
sudo blkid
sudo vim /etc/fstab
```
Add the following to the fstab file; `UUID=F04668504668199C /mnt/my_passport ntfs defaults,auto,users,rw,nofail,umask=000 0 0` . Don't forget to change `ntfs` with your disk `fstype`  <br />
If the filesystem type is FAT or NTFS, add `,umask=000` immediately after nofail - this will allow all users full read/write access to every file on the storage device.<br />
if you do not have the storage device attached when the Pi starts, the Pi will take an extra 90 seconds to start up. You can shorten this by adding `,x-systemd.device-timeout=30` immediately after nofail in step 4. This will change the timeout to 30 seconds, meaning the system will only wait 30 seconds before giving up trying to mount the disk. 

## Communication
In practice, this means that you can access the devices covered by Dataplicity anywhere that they have a viable internet connection. The traffic is routed using encrypted websocket connections, and is robust enough to be used in instances where the internet coverage is flaky. Because the device itself is the originator of the connection, traditional impediments to remote access (such as NAT, firewalls and dynamic IP addressing) are no longer an issue.<br />

WebSocket is the most popular and portable realtime protocol. It provides full-duplex communication over a single TCP connection. WebSockets are a great choice for many use cases, such as financial tickers, chat solutions, or location-based apps, to name just a few. But it’s not the only available option. Before jumping on the WebSocket bandwagon, you should look at the existing alternatives, to make sure they are not a better fit for your use case.<br />

For example, MQTT, which also supports bidirectional communication, is the go-to protocol for IoT devices with limited battery life, and for networks with expensive or low bandwidth, unpredictable stability, or high latency. Another example is Server-Sent Events, a lightweight protocol from both an implementation and usage standpoint. It’s a superior alternative for most browser-based scenarios where unidirectional communication is enough, such as users subscribing to a basic news feed. <br />

WebSockets, MQTT, and SSE are all TCP-based protocols. TCP is designed to be a reliable transport layer protocol, which provides message delivery and ordering guarantees. This is great for many realtime use cases. But for other use cases, a lightweight, speedier protocol is a better option. For example, if your purpose is to stream video data, you’re better off using UDP as your transport layer protocol.<br />

Even if WebSocket is a good choice for your needs, depending on the complexity of your architecture and what you are trying to achieve with your system, you might want to have the flexibility of using multiple protocols, one for each specific use case. <br />

### Socket communication
Some useful URLs
* https://realpython.com/python-sockets/#application-client-and-server
* https://docs.python.org/3/howto/sockets.html#socket-howto
* https://docs.python.org/3/library/codecs.html#encodings-and-unicode
* https://flask-socketio.readthedocs.io/en/latest/
* https://www.youtube.com/watch?v=YvsOUkTUsxg&list=WL&index=27&t=19s
* https://www.youtube.com/watch?v=X4oVGnJLVUg&list=PLIO3UV9ODwNCJR462wvZZlve02-BMeQGh
* https://codingnights.com/coding-fully-tested-python-chat-server-using-sockets-part-1/

## Plex Media Server
### Can't find media External Hard Drive Problem
https://askubuntu.com/questions/395291/plex-media-server-wont-find-media-external-hard-drive

Some useful URLs
* https://support.plex.tv/articles/200264746-quick-start-step-by-step-guides/
* https://support.plex.tv/articles/200288596-linux-permissions-guide/
