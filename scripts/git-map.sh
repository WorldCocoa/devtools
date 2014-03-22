#/bin/bash
#working dirctory is were the Makefile is

#Include our helpers file (the . is short for an include in bash )
. scripts/helpers.sh

#This command takes the argument ${1} from the command line and sends it to git for all repos
#in the repository.list.txt file
for repository in $(cat repository.list.txt); do
    dir_name=$(repository_directory_name ${repository})
    echo "${textblue}------------------ repos/${dir_name} ${textcyan}${1}${textblue} --------------------${textreset}"
    cd repos/${dir_name} && git ${1} && cd ../../
    echo
    echo
done