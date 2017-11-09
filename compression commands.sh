#!/bin/sh
# https://www.digitalocean.com/community/tutorials/an-introduction-to-file-compression-tools-on-linux-servers
# Using Tar Archiving with different Compression Tools i.e. gzip, bzip2, xz

###########################
### Using TAR with gzip ###
###########################
tar czvf <target_name>.tar.gz  <source_directory_name>

# c for achive
# z for 'use gzip for compression'
# v for verbose
# f for file 'must come in the end'

tar tzvf <compressed_file_name>.tar.gz

# to for peeking inside the compressed file


tar xzvf <compressed_file_name>.tar.gz

# x for extract using gzip

############################
### Using TAR with bzip2 ###
############################

# for using bzip2 you can just repalce the z flag with the j flag.

tar cjvf <target_name>.tar.bz2  <source_directory_name>
tar tjvf <compressed_file_name>.tar.bz2
tar xjvf <compressed_file_name>.tar.bz2


#########################
### Using TAR with xz ###
#########################

# for using xz you can just use the J flag instead of the z or j flags
tar cJvf <target_name>.tar.xz  <source_directory_name>
tar tJvf <compressed_file_name>.tar.xz
tar xJvf <compressed_file_name>.tar.xz


# To extract an archive to a directory different from the current, use the -C, or --directory, tar option, as in

tar -x**f archive.tar -C /target/directory








