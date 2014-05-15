#!/usr/bin/env bash

# Install haraka package
sudo npm install -g Haraka

# Copy overrides
git clone https://github.com/madeingnecca/test_mail_server /home/vagrant/test_mail_server
sudo cp -R /vagrant/overrides/haraka/* /home/vagrant/test_mail_server/
sudo chown vagrant:vagrant -R /home/vagrant/test_mail_server/

cd /home/vagrant/test_mail_server

# Install test_mail_server dependencies.
npm install

# Install and launch Haraka daemon.
sudo cp ./contrib/haraka.initscript /etc/init.d/
sudo mv /etc/init.d/haraka.initscript /etc/init.d/haraka
sudo chmod u+x /etc/init.d/haraka

# Load haraka automatically after booting up.
sudo update-rc.d haraka defaults 98 02

# Automatically start haraka
sudo service haraka start
