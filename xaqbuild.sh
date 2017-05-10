#!/bin/bash

cd $HOME
mkdir bin

# vim
sudo apt install vim

# git
sudo apt install git
git config --global user.email xaq.rox@gmail.com
git config --global user.name "Xaq Rothman"

# terminus
sudo apt install curl
sudo apt install php php-curl php-cli php-simplexml
curl -O https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar && php installer.phar install
export PATH="/home/ubuntu/vendor/bin:$PATH"
rm installer.phar

# ruby & ghi
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=ghi
source /home/ubuntu/.rvm/scripts/rvm
ghi config --auth xaqrox

# composer & drush
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --filename=composer --install-dir=$HOME/bin
export PATH="$HOME/.composer/vendor/bin:$PATH"
composer global require drush/drush
rm composer-setup.php

# node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install node
