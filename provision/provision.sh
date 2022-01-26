#!/bin/bash

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

provision() {
    installPackages
    installRuby $1
}

provision $1
