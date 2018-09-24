Install Docker
-----------------
```bash
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update

sudo apt-get install docker-ce

sudo docker run hello-world
```
It is recommended to fix the issue by adding the current user to the docker group:
```bash
sudo usermod -a -G docker disooqi
```

Upgrade Docker CE
-----------------
To upgrade Docker CE, first run `sudo apt-get update`, then follow the installation instructions, choosing the new version you want to install.


Uninstall Docker
-----------------
https://askubuntu.com/questions/935569/how-to-completely-uninstall-docker

To completely uninstall Docker:

Step 1

dpkg -l | grep -i docker

To identify what installed package you have:

Step 2
```bash
sudo apt-get purge -y docker-engine docker docker.io docker-ce  
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  
```
The above commands will not remove images, containers, volumes, or user created configuration files on your host. If you wish to delete all images, containers, and volumes run the following commands:
```bash
sudo rm -rf /var/lib/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
```
You have removed Docker from the system completely.


```bash
docker push ..........
docker pull mongo:latest
sudo docker images | grep 578c3e
sudo docker ps -a
vim Dockerfile

sudo docker build . -t docker101:v1



docker rm 7c2c0e1df721
docker system prune
sudo docker run -it --rm ubuntu:16.04
sudo docker run -it --rm docker101:v1 /bin/bash
```


##############################################################
```Dockerfile
# FROM ubuntu:16.04
FROM python:3.6
LABEL maintainer="MOHAMED ELDESOUKI <disooqi@gmail.com>"

RUN apt-get update
RUN apt-get install python3

# COPY source

RUN mkdir /app
WORKDIR /app

COPY . /app
# ADD / /home

RUN pip install -r requirments.txt
CMD ["python3", "app.py", ""]
```
#################################################################

```bash
docker run -it --rm -p "5432:5432" postgres:9.6

docker run -it --rm --link postgres:goofy  -e DATABASE_URL=wtyuytrewretyuy -p "5000:3000" server_name:v0.1
 pgcli
```

######################## docker-compose.yaml ####################################
```yaml
# declartative vs impritive
version: '3.5'
services: 
  db:
    image: postgres:9.6
    ports:
      - "5432:5432" # if you want to access from the host
    volumes:
      - $HOME/dsfdf:/var/lib/postgres/data
      - dbdata:/var/lib/postgres/data
  server:
    build: server
    environment:
      - DATABASE_URL=postgres://postgres@db:5432/postgres
    ports:
      - "4000:3000" # if you want to access from the host
   client:
# volume mountt
volumes:
  dbdata:
    driver: local
```
#######################################################################
```bash
docker-compose up
docker-compose ps
docker-compose down
docker-compose start server
docker volume ls
```
# Production
############
```bash
docker swarm
kopernares
orecsterating
```
