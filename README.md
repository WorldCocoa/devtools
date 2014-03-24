devtools
========

A repository to help with the developer workflow, testing, and building images for the GlobAllomeTree project

This repository contains a list of other repos to be cloned in repository.list.txt

Usage: 

    git clone git@github.com:GlobAllomeTree/devtools.git
    cd devtools
    make git-clone-all
    make git-status-all
    #warning - the next line will use apt to install lxc and configure the docker daemon
    make docker-setup-lxc
    make base-build
