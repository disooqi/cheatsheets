#!/bin/bash


# Install Kaldi
https://github.com/kaldi-asr/kaldi
https://github.com/alumae/kaldi-gstreamer-server
https://github.com/alumae/gst-kaldi-nnet2-online

https://github.com/jcsilva/docker-kaldi-gstreamer-server


wget -O /tmp/model.tar.gz https://qcristore.blob.core.windows.net/public/asrlive/models/arabic/nnet3sac.tar.gz

# untar it to /opt/model
/opt/model

# In the worker side
vim /opt/model/model.yaml
# and make
out-dir: /home/qcri/spool/asr/nnet3sac


cd kaldi-gstreamer-server
python kaldigstserver/worker.py -u ws://localhost:8888/worker/ws/speech -c /opt/model/model.yaml


#############################################
############## In the client side ###########
#############################################

git clone https://github.com/qcri/alt-hackathon-docs

ssh -L 8888:localhost:8888 qcri@qatslive4520.cloudapp.net
python -m SimpleHTTPServer 2018
