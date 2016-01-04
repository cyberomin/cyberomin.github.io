# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "servlet"
  config.vm.hostname = "celestine.blog"
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provision :shell, :path => "vagrant/setup.sh"
  config.vm.synced_folder ".", "/vagrant", group: "www-data", owner: "www-data", :mount_options => [ "dmode=777", "fmode=777" ]

  config.vm.provider "virtualbox" do |vb|
    vb.name = "Celestine Blog"
    vb.memory = "2048"
    vb.cpus = "2"
  end

  config.ssh.forward_agent = true
end
