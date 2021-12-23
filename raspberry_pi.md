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
