# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "fedora/25-cloud-base"
  config.vm.network :forwarded_port, guest:8888, host:8888
  config.vm.network :forwarded_port, guest:5000, host:5000
  config.vm.network :forwarded_port, guest:8081, host:8081
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.provision :shell, path:"bootstrap.sh"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "openweekwithxfce"
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    #vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
    #vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

end
