#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade 
Python 2.7
# if needed
sudo apt install python-pip
pip install --upgrade pip



sudo pip install tornado
pip install ws4py==0.3.2
sudo pip install pyyaml

sudo apt install python-gobject
sudo apt install python-dbus

# Install Kaldi
https://github.com/kaldi-asr/kaldi
https://github.com/alumae/kaldi-gstreamer-server
https://github.com/alumae/gst-kaldi-nnet2-online
# docker version
https://github.com/jcsilva/docker-kaldi-gstreamer-server
#################################################
##################### kaldi #####################
#################################################
git clone https://github.com/kaldi-asr/kaldi.git

cd kaldi/tools/
extras/check_dependencies.sh
# if needed
sudo apt-get install  zlib1g-dev make automake autoconf subversion
sudo apt-get install g++
sudo apt-get install  libtool
sudo apt-get install libatlas3-base

# run make; it will take time 
make

cd kaldi/src/
./configure --shared
make depend
make
#################################################
########  gst-kaldi-nnet2-online  ###############
#################################################
cd 
# edit Makefile
vim Makefile
KALDI_ROOT?=/home/disooqi/kaldi
# and then save and run
make depend

# and run
KALDI_ROOT=/home/disooqi/kaldi make

wget -O /tmp/model.tar.gz https://qcristore.blob.core.windows.net/public/asrlive/models/arabic/nnet3sac.tar.gz

# untar it to /opt/model
/opt/model

# In the worker side
vim /opt/model/model.yaml
# and make
out-dir: /home/qcri/spool/asr/nnet3sac

Running the server
====================
screen -r kserver
cd kaldi-gstreamer-server
python kaldigstserver/master_server.py --port=8888

C-a d

Running a worker
==================
screen -S w01
# export GST_PLUGIN_PATH=~/kaldi/src/gst-plugin
# GST_PLUGIN_PATH=. gst-inspect-1.0 kaldinnet2onlinedecoder
export GST_PLUGIN_PATH=~/gst-kaldi-nnet2-online/src

cd kaldi-gstreamer-server
python kaldigstserver/worker.py -u ws://localhost:8888/worker/ws/speech -c /opt/model/model.yaml
python kaldigstserver/worker.py -u ws://localhost:8888/worker/ws/speech -c /opt/model/model.yaml


#############################################
############## In the client side ###########
#############################################

git clone https://github.com/qcri/alt-hackathon-docs

ssh -L 8888:localhost:8888 qcri@qatslive4520.cloudapp.net
python -m SimpleHTTPServer 2018
