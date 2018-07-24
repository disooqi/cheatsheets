#### NGINX ####
sudo systemctl reload nginx

# Enable http2
sudo vim /etc/nginx/nginx.conf
#Add this line after `ssl_prefer_server_ciphers on;`
ssl_ciphers EECDH+CHACHA20:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;

## File upload limit 
/etc/nginx/nginx.conf

sudo nginx -t

/etc/nginx/sites-available/default
# https://serverfault.com/questions/400197/add-header-directives-in-location-overwriting-add-header-directives-in-server



### TOMCAT ####

sudo systemctl restart tomcat

## File upload limit 
/opt/tomcat/webapps/manager/WEB-INF/web.xml

## To prevent access to Tomcat 
/opt/tomcat/conf/server.xml

## https://github.com/NitorCreations/tomcat8-war-runner#readme


ab -k -c 350 -n 10000 https://farasa-api.qcri.org/farasa/webapi/lemma?text="الحمد لله"
