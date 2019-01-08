#!/bin/bash


ssh $USER@localhost

Working Folder: /data/sls/qcri/asr/

#To compile kaldi
# We compile kaldi on one of the titans to enable GPU
login to one of the titans, i.e:  ssh disooqi@sls-titan-1.csail.mit.edu
clone kaldi to /data/sls/qcri/asr/disooqi/kaldi 
add cuda lib to your ~/.bashrc 
i.e:
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64


########################
#### COMPILE KALDI #####
########################

#copy working setup
good_setup=/data/sls/arabic/speech/amali/exp/kaldi_2080309/egs/mgb/mgb2.grapheme_1.3M/
new_setup=/data/sls/qcri/asr/disooqi/kaldi/egs/gale_arabic/s5b
 from $good_setup to $new_Setup
cmd.sh
conf/slurm.conf
#path.sh(most of the time we don't need it)


#TRAIN-KALDI
1- connect to holoyoke central node:
login from sls-415-2.csail.mit.edu
We submit jobs from slurm node on holoyoke: 
cd .../egs/galea_arabic/sb5
./run.sh &> progress.log

#to keep an eye on your work:
1- tail -f progress.log  
2- from any machine: squeu (to get the info about slurm running jobs)




You must read/learn:
http://kaldi-asr.org/doc/tutorial.html
slurm tutorial is essential 
bash tutorial is a must the must 


