# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "servlet"
  config.vm.hostname = "cyberomin.blog"
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provision :shell, :path => "vagrant/setup.sh"
  config.vm.synced_folder ".", "/", group: "www-data", owner: "www-data", :mount_options => [ "dmode=777", "fmode=777" ]

  config.vm.provider "virtualbox" do |vb|
    vb.name = "CyberOmin Blog"
    vb.memory = "2048"
  end

  config.ssh.forward_agent = true
end