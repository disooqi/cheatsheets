#!/bin/bash

sudo apt-get update 
sudo apt-get upgrade 
Python 2.7

#################################################
##################### kaldi #####################
#################################################
pip install ws4py==0.3.2
git clone https://github.com/kaldi-asr/kaldi.git
cd kaldi/

cd tools/
extras/check_dependencies.sh
# if needed
sudo apt-get install  zlib1g-dev make automake autoconf subversion
sudo apt-get install g++
sudo apt-get install libatlas3-base
#################################################
########  gst-kaldi-nnet2-online  ###############
#################################################



# Install Kaldi
https://github.com/kaldi-asr/kaldi
https://github.com/alumae/kaldi-gstreamer-server
https://github.com/alumae/gst-kaldi-nnet2-online
# docker version
https://github.com/jcsilva/docker-kaldi-gstreamer-server

cd kaldi-gstreamer-server
python kaldigstserver/master_server.py --port=8888


wget -O /tmp/model.tar.gz https://qcristore.blob.core.windows.net/public/asrlive/models/arabic/nnet3sac.tar.gz

# untar it to /opt/model
/opt/model

# In the worker side
vim /opt/model/model.yaml
# and make
out-dir: /home/qcri/spool/asr/nnet3sac


cd kaldi-gstreamer-server
python kaldigstserver/worker.py -u ws://localhost:8888/worker/ws/speech -c /opt/model/model.yaml
python kaldigstserver/worker.py -u ws://localhost:8888/worker/ws/speech -c /opt/model/model.yaml


#############################################
############## In the client side ###########
#############################################

git clone https://github.com/qcri/alt-hackathon-docs

ssh -L 8888:localhost:8888 qcri@qatslive4520.cloudapp.net
python -m SimpleHTTPServer 2018
