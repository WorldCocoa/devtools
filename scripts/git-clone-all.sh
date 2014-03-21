#/bin/bash
#working dirctory is were the Makefile is

#Include our helpers file (the . is short for an include in bash )
. scripts/helpers.sh

for repository in $(cat repository.list.txt); do
    dir_name=$(repository_directory_name ${repository})
    #If the repository directory does not exist, then clone the repo
    echo "------------------ Cloning repos/${dir_name} --------------------"
    if [ ! -d "repos/${dir_name}" ]; then
        mkdir -p repos 
        git clone ${repository} repos/${dir_name}
    else
        echo "Already cloned"
    fi
    echo
    echo
done