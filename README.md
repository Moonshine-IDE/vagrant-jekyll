# vagrant-jekyll
This VM provides a fresh Jekyll instalation.

We use a standard Ubuntu/Bionic as the base image, and install Ruby + Jekyll.

The website (Jekyll project) source code is copied from the host machine to the guest VM (through shared folders) where Jekyll can be executed transforming the templates, text files and assets into a static website.  
The generated website will be localted within the standard `_site` folder of the Jekyll project sources. Given that the shared folder synchronization is bidirectional (host->guest and guest->host), the `_site` folder will be available in the host machine too.

# Requirements
- Git
- VirtualBox
- Vagrant
- [Optional] Moonshine-IDE


# VirtualBox Vagrant setup
1. [Download](https://www.virtualbox.org/wiki/Downloads) and install VirtualBox.
1. [Download](https://www.vagrantup.com/downloads) and install Vagrant.
1. [Download](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and install Git.
1. [Optional] [Download](https://moonshine-ide.com/) and install Moonshine-IDE.
1. [Optional] If you want to use the Moonshine IDE Website (which is a Jekyll project) to test this, then using Git [clone](https://git-scm.com/docs/git-clone) the [MoonshineIDE website repository](https://github.com/Moonshine-IDE/MoonshineWebsite).
    1. **IMPORTANT**: Comment or remove the gem `sass` from the `Gemfile` of the Moonshine IDE website.
1. Using Git, [clone](https://git-scm.com/docs/git-clone) the [vagrant-jekyll repository](https://github.com/Moonshine-IDE/vagrant-jekyll) (this project).
1. Open the project in Moonshine IDE by double-clicking `JekyllWebsite.javaproj` (or Project > Open/Import Project)
3. Locate the `Vagrantfile` in the base path of this project and set the followin variables:
    1.  `PROJECT_SOURCE_IN_HOST`: the path where the Jekyll project (MoonshineWebsite or other) resides.
    1.  `RUBY_VERSION`: set the Ruby version that will be installed in the VM.
4. Use the Vagrant support in Moonshine IDE to launch the virtual machine: find the Vagrantfile and use the right click to open the Context menu, select `Vagrant` > `Up`. Once the process completes a Ruby+Jekyll virtual machine will be running. 
5. Use the utility scripts to build your site and start an HTTP server:
    1. If you are using Windows: Open a command line and execute the `run-moonshine.bat`  script.
    1. If you are using Linux or macOS: Open a command line and execute the `run-moonshine.sh` script.
