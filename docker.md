Best Practices (for Python Developers)
=========================================
* https://testdriven.io/blog/docker-best-practices/

Resources
=========
* https://docs.docker.com/
* https://realpython.com/tutorials/docker/
* https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-docker-on-ubuntu-18-04
* https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
* https://www.digitalocean.com/community/tutorials/how-to-build-and-deploy-a-flask-application-using-docker-on-ubuntu-18-04
* https://www.digitalocean.com/community/tags/docker?subtype=tutorial
* https://www.digitalocean.com/community/tutorials/how-to-set-up-django-with-postgres-nginx-and-gunicorn-on-ubuntu-18-04
* https://medium.com/@riken.mehta/full-stack-tutorial-flask-react-docker-ee316a46e876
* https://medium.com/@dwernychukjosh/setting-up-nginx-gunicorn-celery-redis-supervisor-and-postgres-with-django-to-run-your-python-73c8a1c8c1ba
* https://www.tensorflow.org/tfx/serving/docker

Install Docker
-----------------
* https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
* https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker
* https://docs.docker.com/engine/install/linux-postinstall/
* 
```bash
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# this is old. get the latest from the official website
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
If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
```bash
sudo usermod -aG docker ${USER}

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R

```

Make sure that docker deamon is working by running `sudo systemctl status docker`

As an example, let’s run a container using the latest image of Ubuntu. The combination of the -i and -t switches gives you interactive shell access into the container: `docker run -it ubuntu`

To exit the container, type `exit` at the prompt.


Configure Docker to start on boot
---------------------------------
* https://docs.docker.com/install/linux/linux-postinstall/#configure-where-the-docker-daemon-listens-for-connections
```bash
sudo systemctl enable docker
sudo chkconfig docker on
```

Upgrade Docker CE
-----------------
To upgrade Docker CE, first run `sudo apt-get update`, then follow the installation instructions, choosing the new version you want to install.


Learn Docker
------------
* https://docs.docker.com/get-started/
* https://docs.docker.com/develop/

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
docker images
```

List the containers (spawned by the image). If it were still running, you would not need the `--all` option:
To view all containers — active and inactive, run docker ps with the -a switch:
```bash
docker container ls [-a|--all] [-q]
docker container list
docker ps [-a]
```


Remove Image
```bash
docker rmi <Image ID>
```

Remove container
```bash
docker rm <CONTAINER ID>
```

## Docker Compose
* From your project directory, start up your application by running `docker-compose up`
* Stop the application, either by running `docker-compose down` from within your project directory in the second terminal, or by hitting CTRL+C in the original terminal where you started the app.
* If you want to run your services in the background, you can pass the `-d` flag (for “detached” mode) to `docker-compose up` and use `docker-compose ps` to see what is currently running: `docker-compose up -d`
* If you started Compose with docker-compose up -d, stop your services once you’ve finished with them: `docker-compose stop`
* Pass --volumes to also remove the data volume used by the Redis container: `docker-compose down --volumes`


##################################################################################################################
```bash
docker push ..........

# Execute the following command to download the official mongo image to your computer:
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

### Postgres-docker
```bash
docker run --rm --name pg-docker -e POSTGRES_PASSWORD=docker -e POSTGRES_USER=arabagent -e POSTGRES_DB=a2db -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres
docker run -d --name dev-pgadmin -e 'PGADMIN_DEFAULT_PASSWORD=Retrieval7.' -e 'PGADMIN_DEFAULT_EMAIL=disooqi@gmail.com' -p 80:80 dpage/pgadmin4

postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]

docker logs pg-docker
sudo rm docker/ -r

docker exec -it pg-docker bash
psql -U arabagent -d a2db

docker inspect dev-postgres -f "{{json .NetworkSettings.Networks }}"
docker volume rm arabagent-data
```

### .env file 
https://docs.docker.com/compose/environment-variables/#the-env-file
* You can set default values for any environment variables referenced in the Compose file, or used to configure Compose, in an environment file named .env:

```bash

$ cat .env
TAG=v1.5

$ cat docker-compose.yml
version: '3'
services:
  web:
    image: "webapp:${TAG}"

```
