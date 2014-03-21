#/bin/bash
#working dirctory is were the Makefile is

#Include our helpers file (the . is short for an include in bash )
. scripts/helpers.sh

for repository in $(cat repository.list.txt); do
    dir_name=$(repository_directory_name ${repository})

    echo "------------------ Status ${dir_name} --------------------"
    cd ${dir_name} && git status && cd ..
	echo
    echo
done