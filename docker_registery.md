Create user disooqi
```bash
adduser disooqi
usermod -aG sudo disooqi
ufw allow OpenSSH
ufw enable
rsync --archive --chown=disooqi:disooqi ~/.ssh /home/disooqi
```

#### Docker
sign-in as disooqi
```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker
sudo usermod -aG docker ${USER}
su - ${USER}
groups
```

#### Docker Compose
```bash
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
docker compose version
```

#### Nginx
```bash
sudo apt update
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
systemctl status nginx
sudo systemctl enable nginx
sudo mkdir -p /var/www/dockers.eldesouki.com/html
sudo chown -R $USER:$USER /var/www/dockers.eldesouki.com/html
sudo chmod -R 755 /var/www/dockers.eldesouki.com
vim /var/www/dockers.eldesouki.com/html/index.html
# Put html content
sudo vim /etc/nginx/sites-available/dockers.eldesouki.com
# Put in the configuration block details
sudo ln -s /etc/nginx/sites-available/dockers.eldesouki.com /etc/nginx/sites-enabled/
sudo vim /etc/nginx/nginx.conf
# server_names_hash_bucket_size 64; # uncomment
sudo nginx -t
sudo systemctl restart nginx
```

#### Secure Nginx with Let's Encrypt
```bash
sudo snap install core; sudo snap refresh core
sudo apt remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo ufw status
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo certbot --nginx -d dockers.eldesouki.com
sudo systemctl status snap.certbot.renew.service
sudo certbot renew --dry-run
```

#### Set Up a Private Docker Registry
```bash
mkdir ~/docker-registry
cd ~/docker-registry
mkdir data
vim docker-compose.yml
# put in the details of docker compose
docker compose up
# You can press CTRL+C to stop its execution.
sudo vim /etc/nginx/sites-available/dockers.eldesouki.com
# Update location to forward traffic to port 5000
sudo systemctl restart nginx
docker compose up
# Visit https://dockers.eldesouki.com/v2
# Press CTRL+C to stop its execution.
sudo apt install apache2-utils -y
mkdir ~/docker-registry/auth
cd ~/docker-registry/auth
htpasswd -Bc registry.password disooqi
# To add more users, re-run the previous command without -c
# edit docker-compose.yml to order Docker to use the file you created to authenticate users. 
cd ~/docker-registry
docker compose up
# In your browser, refresh the page of your domain. You’ll be asked for a username and password
# Exit by pressing CTRL+C in your terminal.
# Start Docker Registry as a Service by editing docker-compose.yml
docker compose up -d
# Increasing File Upload Size for Nginx
sudo vim /etc/nginx/nginx.conf
# Add to the http section client_max_body_size 16384m; # 16GB 
sudo systemctl restart nginx
```

#### Using the Docker Registery
```bash
docker login https://dockers.eldesouki.com -u disooqi
docker tag a2-a2-data-access:latest dockers.eldesouki.com/a2-data-access
docker tag a2-a2-api:latest dockers.eldesouki.com/a2-api
docker push dockers.eldesouki.com/a2-data-access
```

