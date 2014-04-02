devtools
========

A repository to help with the developer workflow, testing, and building images for the CocoaMap project.

This repository contains a list of other repos to be cloned in repository.list.txt

Usage: 


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