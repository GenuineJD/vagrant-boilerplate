# Work In Progress
This is a work in progress repo, not ready for release.  Files may be missing or incomplete.  Use at your own discretion.

# Introduction
This project is meant as a bare bones, but configurable [Vagrant](https://www.vagrantup.com/) [VirtualBox](https://www.virtualbox.org/) project.  It is meant to be downloaded and used as a starting point for your Vagrant project.  It includes a pre-built [Vagrantfile](http://docs.vagrantup.com/v2/vagrantfile/index.html) and config.json file where most settings will be customized.  The Vagrantfile pulls settings from config.json, including base box, networking settings, mapped paths, forwarded ports, pre- and post- shell scripts and multiple provisioners.

Vagrant Boilerplate was born out of a regular provisioning of VirtualBox VMs for a variety of projects and consistently copy-and-pasting various refined versions of the same setup.  For even greater flexibility in customization and options, please also see the awesome https://puphpet.com!  For a simple and quick setup, download the lastest codebase here!

# Usage

### Minimum Requirements

* Vagrant
* VirtualBox

### Getting Started

1. Download the latest zip of this project
2. Make any changes to the vagrant/config.json file
3. Start the VM
```
$ vagrant up
```

If no changes are made, the VM will launch, but no software will be installed.  A sample apache puppet class has been included as a sample, but is commented out.

# Organization

* vagrant/ Includes all Vagrant and provisioner configuration files.
* www/ Includes any files that might be served by apache.  This folder maps to /var/www on the guest VM by default.

# Provisioners
Currently, only [Puppet](http://docs.vagrantup.com/v2/provisioning/puppet_apply.html) is supported in this project.  Ideally, I'll eventually add Chef provisioning amongst others.  The goal will be to keep this boilerplate very lightweight.
