#!/bin/sh

# This is the Pool install script.
echo "Pool install script."

echo "Installing... Please wait!"

sleep 3

rm -rf /usr/lib/node_modules
rm -rf node_modules
apt remove --purge -y nodejs node
rm /etc/apt/sources.list.d/*



service fail2ban start
service fail2ban enable
service redis-server start
service redis-server enable
service ntp start
service ntp enable

rm -rf ~/.nvm
rm -rf ~/.npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
chown -R $USER:$GROUP ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install v12.13.0
nvm use v12.13.0
npm update -g

npm install -g webpack@4.46.0
npm install -g pm2@4.5.6

npm install
npm update
npm audit fix
npm install sha3
npm install logger

echo "Installation completed!"

exit 0
