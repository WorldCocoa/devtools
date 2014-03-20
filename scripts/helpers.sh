
repository_directory_name() {
	#directory_name
	#Get the default directory name from the github url
	#for example git@github.com:GlobAllomeTree/docker-elasticsearch.git becomes docker-elasticsearch.
    #The tr '[:upper:]' '[:lower:]' converts to lowercase
    #The sed 's/\.git//' strips off the .git ending
    #The sed 'sed 's:.*/::' returns everything after the last slash
    #${1} is the first argument passed to this function
    echo ${1} | sed 's:.*/::' | sed 's/\.git//' | tr '[:upper:]' '[:lower:]'
}