#### NGINX ####
sudo systemctl reload nginx

## File upload limit 
/etc/nginx/nginx.conf

sudo nginx -t

/etc/nginx/sites-available/default

### TOMCAT ####

sudo systemctl restart tomcat

## File upload limit 
/opt/tomcat/webapps/manager/WEB-INF/web.xml

## To prevent access to Tomcat 
/opt/tomcat/conf/server.xml



ab -k -c 350 -n 10000 https://farasa-api.qcri.org/farasa/webapi/lemma?text="الحمد لله"
