# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  # App server
  config.vm.define "app-server" do |appserver|
    appserver.vm.box = "ubuntu/xenial64"
    appserver.vm.hostname = "webserver.example.com"
    appserver.vm.network "private_network", ip: "172.42.42.100"
    appserver.vm.provider "virtualbox" do |v|
      v.name = "app-server"
      v.memory = 1024
      v.cpus = 1
    end
    appserver.vm.provision "shell", path: "install-docker.sh"
  end

end
