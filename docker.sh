docjer push ..........
docker pull mongo:latest
sudo docker images | grep 578c3e
sudo docker ps -a
vim Dockerfile

sudo docker build . -t docker101:v1



docker rm 7c2c0e1df721
docker system prune
sudo docker run -it --rm ubuntu:16.04
sudo docker run -it --rm docker101:v1 /bin/bash



##############################################################
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
#################################################################
docker run -it --rm -p "5432:5432" postgres:9.6

docker run -it --rm --link postgres:goofy  -e DATABASE_URL=wtyuytrewretyuy -p "5000:3000" server_name:v0.1
 pgcli


######################## docker-compose.yaml ####################################
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
#######################################################################3
docker-compose up
docker-compose ps
docker-compose down
docker-compose start server
docker volume ls

# Production
############
docker swarm
kopernares
orecsterating
