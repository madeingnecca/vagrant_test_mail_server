#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install software-properties-common python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get -y update
sudo apt-get -y install nodejs
