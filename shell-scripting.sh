#!/bin/sh
# https://www.amazon.com/Linux-Command-Shell-Scripting-Bible/dp/111898384X/ref=as_li_ss_tl?ie=UTF8&qid=1465646324&sr=8-4&keywords=bash+shell+scripting&linkCode=sl1&tag=nethta-20&linkId=9cc1bff704b553e6ce0632106784334f
# https://www.youtube.com/watch?v=tPKdfbL1Zv4&t=2904s

## SCP
####################
# http://www.hypexr.org/linux_scp_help.php


# This will find "some string" in /home/yourusername directory. The search will ignore case (-i) and recurse directories (-r). 
# You can use / as the directory to search in the whole directory but that might not be very efficient. 
grep -r -i "some string" /home/yourusername


find / -type f -iname "filename*"
