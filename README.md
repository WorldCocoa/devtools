devtools
========

A repository to help with the developer workflow, testing, and building images for the CocoaMap project.

This repository contains a list of other repos to be cloned in repository.list.txt


Getting a Local Instance Running Quickly from Ubuntu
----------------------------------------------------

Preparation to build virtual machine from package for Windows

    get a github account.
    get a index.docker.io account
    give usernames and passwwords to alex over skype not email!!
    install vagrant  (http://www.vagrantup.com/)
    install virtual box

    download vagrant "box" package from S3
    place it in a cocoamap_project

    make a local file with https://github.com/WorldCocoa/devtools/blob/master/VagrantFile.windows
    it should a peer to Vagrantfile.windows 
    Vagrantfile.windows should be renamed to "Vagrantfile"
    use the CMD utility to type the following, when inside that folder.
    vagrant box add -n cocoamap_2014_04_08 cocoamap_2014_04_08.box
    vagrant up
    vagrant ssh

    rm -rf devtools
    git clone git@github.com:WorldCocoa/devtools.git
    cp Makefile.local.sample Makefile.local
    make git-clone-all
    make run

    browse at 127.0.0.1:8081


From an ubuntu prompt:

    cd ~
    sudo apt-get install git
    git clone git@github.com:WorldCocoa/devtools.git
    cd devtools/
    cp Makefile.local.sample Makefile.local
    make git-clone-all
    docker login
    make deploy
    make app-server-attach
    cd /opt/code
    make local-deploy


For Server (first time):

    # get git
    cd ~
    sudo apt-get update
    sudo apt-get git

    # create ssh key"""
    ssh-keygen -t rsa -C "alext@bitbamboo.com"

    # get the files
    git clone git@github.com:WorldCocoa/devtools.git
    cd devtools/
    cp Makefile.local.sample Makefile.local
    sudo apt-get install make
    make git-clone-all
    make docker-setup-lxc
    exit #  necessary? hard to tell because groups doesn't return correct result until restart.
    ssh wcf-app
    docker login
    make deploy
    make host-nginx-setup-app
    make app-server-attach
    cd /opt/code
    make local-deploy




To Build from Scratch: 
----------------------

    git clone git@github.com:CocoaMap/devtools.git
    cd devtools
    make git-clone-all
    make git-status-all
    # warning - the next line will use apt to install lxc and configure the docker daemon
    # you will need to be in a virtual machine or on an ubuntu OS to do this step.
    make docker-setup-lxc
    make base-build
    make psql-add-postgres-ubuntu-client
    make psql-build
    make app-server-build
    make run
    make psql-init  or make psql-reset-db (if db already exists)

    make app-server-attach
    cd /opt/code
    make local-deploy
