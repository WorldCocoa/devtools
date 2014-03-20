#/bin/bash
#working dirctory is were the Makefile is

#Include our helpers file (the . is short for an include in bash )
. scripts/helpers.sh

for repository in $(cat repository.list.txt); do
    dir_name=$(repository_directory_name ${repository})
    #If the repository directory does not exist, then clone the repo
    if [ ! -d ${dir_name} ]; then 
    	git clone ${repository} ${dir_name}
	fi
done