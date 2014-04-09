# Makefile for managing the CocoaMap docker

############################### Var setup. use Makefile.local to override #################
# For operators :=  =  ?=  !=  see http://stackoverflow.com/a/448939/420688

PROJECT_ROOT := $(shell pwd)
SHELL := /bin/bash

#Include Makefile.local if it exists
-include Makefile.local

############################### Add in helper commands ######################

include include.DockerUtils.Makefile
include include.GitUtils.Makefile
include include.NginxUtils.Makefile

############################### Add in commands from child Makefiles ######################

-include repos/docker-base/Makefile
-include repos/docker-postgresql/Makefile
-include repos/cocoamap/Makefile 

############################### Global commands for running and initializing app ###########################

deploy: init run

init: docker-setup-lxc psql-add-postgres-ubuntu-client psql-init

run: psql-run app-server-run

stop: elastic-stop psql-stop

clean: elastic-clean psql-clean
