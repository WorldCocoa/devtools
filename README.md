devtools
========

A repository to help with the developer workflow, testing, and building images for the CocoaMap project.

This repository contains a list of other repos to be cloned in repository.list.txt


Getting a Local Instance Running Quickly
----------------------------------------


get a github account.
get a index.docker.io account
give usernames to alex
Alex adds username to github WorldCocoa organization list.
install vagrant  (http://www.vagrantup.com/)
create a virtual box
mkdir cocoamap_project

git clone git@github.com:WorldCocoa/devtools.git
cd devtools/
cp Makefile.local.sample Makefile.local
make git-clone-all
vagrant up
vagrant ssh
cd devtools
docker login

# make docker-setup-lxc
# make psql-add-postgres-ubuntu-client
# make psql-init

make init
make run
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