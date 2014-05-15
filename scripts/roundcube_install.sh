#!/usr/bin/env bash

# We need php, apache and mysql first.
bash /vagrant/scripts/lamp_install.sh

# Download Roundcube
git clone https://github.com/roundcube/roundcubemail.git /home/vagrant/roundcube

# Copy overrides.
sudo cp -R /vagrant/overrides/roundcube/* /home/vagrant/roundcube/
sudo chown vagrant:vagrant -R /home/vagrant/roundcube/

# Create db user and db, via root.
MYSQL_AUTH="-u root --pass=root"
SQL_CREATE_1="CREATE DATABASE IF NOT EXISTS roundcubemail;"
SQL_CREATE_2="GRANT ALL ON *.* TO 'roundcube'@'localhost' IDENTIFIED BY 'roundcube';"
SQL_CREATE_3="FLUSH PRIVILEGES;"
SQL_CREATE="${SQL_CREATE_1}${SQL_CREATE_2}${SQL_CREATE_3}"

mysql $MYSQL_AUTH -e "$SQL_CREATE"

# Import initial database.
mysql $MYSQL_AUTH -D roundcubemail < /home/vagrant/roundcube/SQL/mysql.initial.sql

# Move roundube inside document root.
sudo mv /home/vagrant/roundcube /var/www/html/
