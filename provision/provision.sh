#!/bin/bash

PROVISION_DIR=/vagrant/provision
HOME_BIN_DIR=$HOME/bin

installPackage()
{
    local packages=$*
    echo "Installing $packages"
    sudo apt-get install -y $packages >/dev/null 2>&1
}

updatePackages()
{
    sudo apt-get update >/dev/null 2>&1
}

installPackages()
{
    updatePackages
    installPackage zip unzip make software-properties-common
}

createAndMoveToHomeBinDir()
{
    echo "Creating and moving to bin directory"
    mkdir $HOME_BIN_DIR
    cd $HOME_BIN_DIR
}

installRuby()
{
    version=$1

    sudo apt install gnupg2
    curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
    curl -sSL https://get.rvm.io | bash -s stable # --ruby

    source ~/.rvm/scripts/rvm
    rvm get master && rvm install $version

    gem install jekyll bundler
}

createBashrcAndBashProfile()
{
    echo "Update .bashrc and .bash_profile"
    cat $PROVISION_DIR/bash_profile.template > $HOME/.bash_profile
}

provision() {
    createAndMoveToHomeBinDir
    createBashrcAndBashProfile
    installPackages
    installRuby $1
}

if [ ! -f "/var/vagrant_provision" ]; then
    sudo touch /var/vagrant_provision
    provision $1
else
    echo "Machine already provisioned. Run 'vagrant destroy' and 'vagrant up' to re-create."
fi
