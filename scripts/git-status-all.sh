#/bin/bash
#working dirctory is were the Makefile is

#Include our helpers file (the . is short for an include in bash )
. scripts/helpers.sh

for repository in $(cat repository.list.txt); do
    dir_name=$(repository_directory_name ${repository})

    echo "------------------ Status repos/${dir_name} --------------------"
    cd repos/${dir_name} && git status && cd ../../
	echo
    echo
done