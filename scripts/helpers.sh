
repository_directory_name() {
    #directory_name
    #Get the default directory name from the github url
    #for example git@github.com:WorldCocoa/docker-elasticsearch.git becomes docker-elasticsearch.
    #The tr '[:upper:]' '[:lower:]' converts to lowercase
    #The sed 's/\.git//' strips off the .git ending
    #The sed 'sed 's:.*/::' returns everything after the last slash
    #${1} is the first argument passed to this function
    echo ${1} | sed 's:.*/::' | sed 's/\.git//' | tr '[:upper:]' '[:lower:]'
}


############################## Colors ##################################

#Usage echo "Output a ${textyellow} coloured ${textreset} ${textred} word ${textreset}."
textreset=$(tput sgr0) 
textblack=$(tput setaf 0)
textred=$(tput setaf 1)
textgreen=$(tput setaf 2) 
textyellow=$(tput setaf 3) 
textblue=$(tput setaf 4)
textmagenta=$(tput setaf 5)
textcyan=$(tput setaf 6)
textwhite=$(tput setaf 7)