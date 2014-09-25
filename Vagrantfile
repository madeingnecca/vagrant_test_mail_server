# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"

  # Forwarded ports.
  # SMTP server will be available in localhost:2525.
  config.vm.network "forwarded_port", guest: 25, host: 2525

  # Roundcube will be available in localhost:8081/roundcube.
  config.vm.network "forwarded_port", guest: 80, host: 8081

  config.vm.network "public_network"

  # VirtualBox machine attributes.
  config.vm.provider "virtualbox" do |vb|
    vb.name = "test_mail_server"
  end

  # Install server and dependencies.
  config.vm.provision "shell", path: "install.sh"
end
