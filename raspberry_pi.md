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

## Communication
In practice, this means that you can access the devices covered by Dataplicity anywhere that they have a viable internet connection. The traffic is routed using encrypted websocket connections, and is robust enough to be used in instances where the internet coverage is flaky. Because the device itself is the originator of the connection, traditional impediments to remote access (such as NAT, firewalls and dynamic IP addressing) are no longer an issue.<br />

WebSocket is the most popular and portable realtime protocol. It provides full-duplex communication over a single TCP connection. WebSockets are a great choice for many use cases, such as financial tickers, chat solutions, or location-based apps, to name just a few. But it’s not the only available option. Before jumping on the WebSocket bandwagon, you should look at the existing alternatives, to make sure they are not a better fit for your use case.<br />

For example, MQTT, which also supports bidirectional communication, is the go-to protocol for IoT devices with limited battery life, and for networks with expensive or low bandwidth, unpredictable stability, or high latency. Another example is Server-Sent Events, a lightweight protocol from both an implementation and usage standpoint. It’s a superior alternative for most browser-based scenarios where unidirectional communication is enough, such as users subscribing to a basic news feed. <br />

WebSockets, MQTT, and SSE are all TCP-based protocols. TCP is designed to be a reliable transport layer protocol, which provides message delivery and ordering guarantees. This is great for many realtime use cases. But for other use cases, a lightweight, speedier protocol is a better option. For example, if your purpose is to stream video data, you’re better off using UDP as your transport layer protocol.<br />

Even if WebSocket is a good choice for your needs, depending on the complexity of your architecture and what you are trying to achieve with your system, you might want to have the flexibility of using multiple protocols, one for each specific use case. <br />

## [How to setup a static IP address?](https://thepihut.com/blogs/raspberry-pi-tutorials/16683276-how-to-setup-a-static-ip-address-on-your-raspberry-pi)
1. edit /etc/network/interfaces

## Developing on the PI
If installing an new virtual environment, don't forget to include `--system-site-packages` to consider some dependencies like GPIO.<br />
If you already created the virtualenv, you can enable them by deleting following file:
your_venv_dir/lib/pythonXXX/no-global-site-packages.txt


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



