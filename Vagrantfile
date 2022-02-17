# -*- mode: ruby -*-
# vi: set ft=ruby :

# This VM provides a fresh Jekyll instalation.
# We use a standard Ubuntu Bionic as the base image, and install Ruby + Jekyll. 
#
# The website source (Jekyll project) code is copied from the host machine to the VM where 
# Jekyll can be executed transforming the templates, text files and assets into a static website.
# The generated website will be localted within the standard _site folder of the Jekyll 
# project sources.

RUBY_VERSION="3.0.0"
IS_SASS_USED="true"

# Path in the host to the Jekyll project sources (Where the _config.yml file resides)
# Example Windows: C:\\example\\path\\JekyllProject
# Example Linux: /example/path/JekyllProject
PROJECT_SOURCE_IN_HOST="C:\\example\\path\\JekyllProject"

Vagrant.configure(2) do |config|

  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "jekyll-vm"
    vb.memory = "1024"
  end

  config.vm.synced_folder PROJECT_SOURCE_IN_HOST, "/vagrant/jekyll-project"

  config.vm.network "forwarded_port", guest: 4000, host: 4000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 35729, host: 35729, host_ip: "127.0.0.1"

  config.vm.provision "shell", 
    path: "provision/provision.sh", 
    privileged: false, 
    args: [RUBY_VERSION]

# MoonshineWebsite workaround: for error missing css directory
  config.vm.provision "shell", 
    inline: "mkdir -p /vagrant/jekyll-project/css", 
    privileged: false

  config.vm.provision "shell", 
    path: "provision/run.sh", 
    privileged: false,
    args: [IS_SASS_USED],
    run: "always"

end
