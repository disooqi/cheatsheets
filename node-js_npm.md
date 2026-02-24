#!/bin/sh
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

## Installing Node Using the Node Version Manager (NVM)
According to https://github.com/nvm-sh/nvm , 
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source ~/.bashrc
nvm list-remote
nvm install v<00000000>
nvm list

# Install latest LTS
nvm install --reinstall-packages-from=current 'lts/*'
nvm alias default v24.13.1

nvm uninstall v16.20.2
```
