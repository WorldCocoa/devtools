#/bin/bash
for line in $(cat repository.list.txt); do
	#directory_name
	#Get the default directory name from the github url
	#for example git@github.com:GlobAllomeTree/docker-elasticsearch.git becomes docker-elasticsearch.
    directory_name=$(echo ${line} | sed 's:.*/::' | sed 's/\.git//')  
    echo $directory_name
    echo $line
done