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

RUN pip install -r requirments.txt
CMD ["python3", "app.py", ""]
#################################################################
