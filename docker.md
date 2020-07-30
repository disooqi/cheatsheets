https://docs.docker.com/
https://realpython.com/tutorials/docker/
https://www.digitalocean.com/community/tutorials/how-to-build-and-deploy-a-flask-application-using-docker-on-ubuntu-18-04
https://www.digitalocean.com/community/tags/docker?subtype=tutorial
https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-18-04
https://medium.com/@riken.mehta/full-stack-tutorial-flask-react-docker-ee316a46e876
https://medium.com/@dwernychukjosh/setting-up-nginx-gunicorn-celery-redis-supervisor-and-postgres-with-django-to-run-your-python-73c8a1c8c1ba

https://www.tensorflow.org/tfx/serving/docker

Install Docker
-----------------
https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker
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
sudo groupadd docker
sudo usermod -a -G docker disooqi

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R
```

Configure Docker to start on boot
---------------------------------
https://docs.docker.com/install/linux/linux-postinstall/#configure-where-the-docker-daemon-listens-for-connections
```bash
sudo systemctl enable docker
sudo chkconfig docker on
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


Use Docker
===========
To list all images
```bash
docker image ls
```

List the hello-world container (spawned by the image) which exits after displaying its message. If it were still running, you would not need the `--all` option:
```bash
docker container ls [-a|--all] [-q]
docker container list
docker ps -a
```


Remove Image
```bash
docker rmi <Image ID>
```

Remove container
```bash
docker rm <CONTAINER ID>
```
##################################################################################################################
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
#########################################################################
```bash
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
   
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo systemctl status docker
 
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG


sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
  
docker-machine  --version

sudo apt-get install virtualbox

vim Dockerfile
docker build -t cowsay .
docker run --rm cowsay
docker run -it --rm python:rc

docker images
docker ps -a

docker rmi fa50228a2a35
docker rm fa50228a2a35
```
