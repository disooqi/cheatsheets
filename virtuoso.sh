################################################################
###  installing "Virtuoso open source" on Ubuntu 18.04       ###
###  http://vos.openlinksw.com/owiki/wiki/VOS/VOSUbuntuNotes ###
################################################################

sudo apt-get update
apt-cache search '^virtuoso'
sudo apt install  virtuoso-opensource

# check existance of path /usr/bin/isql-vt

# In accordance with Debian policy that services should start immediately after they've been installed, 
# Ubuntu have created a default instance based on a configuration file located at /etc/virtuoso-opensource-6.1/virtuoso.ini; 
# check existance of path  /etc/virtuoso-opensource-6.1/virtuoso.ini

# the database itself lives in /var/lib/virtuoso-opensource-6.1/db/

# Also VADs are installed from the following PATH
# Installing: /usr/share/virtuoso-opensource-6.1/vad/tutorial_dav.vad
# also mybe check here to /usr/local/share/virtuoso/vad/ 

# Virtuoso only requires root if you wish to use it as a webserver listening on port 80; by default it listens only on 
# high ports (i.e., above 1024).)

# To start the server in foreground mode with maximum debugging information.  To run it as a daemon instead, omit the "-d" 
virtuoso-t -fd

# You can still see most of what's happening by running 
tail -f virtuoso.log


# Unfortunately, both unixODBC and Virutoso provide a command 'isql', used to access data sources from the 
# commandline (in unixODBC, an ODBC DSN; in Virtuoso, the SQL interface). In order to allow both packages to 
# coexist, Ubuntu rename Virutoso's isql command to isql-vt.

################################################################
###  LOADING RDF Knowledge base to "Virtuoso open source"    ###
###  http://vos.openlinksw.com/owiki/wiki/VOS/VOSUbuntuNotes ###
################################################################

