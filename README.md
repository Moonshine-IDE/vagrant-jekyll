# jekyll-vagrant
This VM provides a fresh Jekyll instalation.

We use a standard Ubuntu/Bionic as the base image, and install Ruby + Jekyll.
The website source code is copied from the host machine to the VM where Jekyll can be executed transforming the templates, text files and assets into a static website.

The generated website will be localted within the standard `_site` folder of the Jekyll project sources.

We provide this Ruby+Jekyll VM as an alternative for developers to be able to work without the need of having Ruby or Jekyll installed into their main development environments.

# Requirements
- Git
- VirtualBox
- Vagrant
- [Optional] Moonshine-IDE


# VirtualBox Vagrant setup
1. [Download](https://www.virtualbox.org/wiki/Downloads) and install VirtualBox.
1. [Download](https://www.vagrantup.com/downloads) and install Vagrant.
1. [Download](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and install Git.
1. Using Git, [clone](https://git-scm.com/docs/git-clone) the [MoonshineIDE website repository](https://github.com/Moonshine-IDE/MoonshineWebsite).
1. Using Git, [clone](https://git-scm.com/docs/git-clone) the [jekyll-vagrant repository](https://github.com/Moonshine-IDE/jekyll-vagrant).
1. Update the `Vagrantfile` in the base path of the jekyll-vagrant folder, set the `PROJECT_SOURCE_IN_HOST` variable to the path where the Jekyll project (MoonshineWebsite) resides.
1. Open a command line and change directory to the base path of this project.
1. Execute the `vagrant up` command, once the process completes a Ruby+Jekyll virtual machine will be running.
1. Execute the `run-moonshine.sh` utility script to build your site and start an HTTP server.
