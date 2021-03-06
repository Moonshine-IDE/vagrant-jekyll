#!/bin/bash

DART_SASS_VERSION="1.49.7"
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
    installPackage zip unzip make software-properties-common wget
}

installRuby()
{
    version=$1

    sudo apt-get install gnupg2 -y
    curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
    curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
    curl -sSL https://get.rvm.io | bash -s stable # --ruby

    source ~/.rvm/scripts/rvm
    rvm get master && rvm install $version

    gem install jekyll bundler
}

provision() {
    installPackages
    installDartSass
    installRuby $1
}

installDartSass() {
	wget -c "https://github.com/sass/dart-sass/releases/download/$DART_SASS_VERSION/dart-sass-$DART_SASS_VERSION-linux-x64.tar.gz" -O - | tar -xz -C ~/
    echo 'export PATH="$PATH:$HOME/dart-sass"' | tee -a ~/.bashrc ~/.profile > /dev/null
}

provision $1
