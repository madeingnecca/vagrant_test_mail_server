#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install dovecot-imapd
sudo cp -Rp /vagrant/overrides/dovecot/* /etc/dovecot/

sudo service dovecot restart
