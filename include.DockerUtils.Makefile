
############################################ DOCKER SHORTCUTS ##########################################

docker-stop-all-containers:
	docker stop `docker ps --no-trunc=true -q`

#http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-io-containers
#TODO: Add a confirm here
docker-remove-stopped-containers:
	docker rm `docker ps --no-trunc=true -a -q`

docker-remove-all-containers: docker-stop-all-containers
	docker rm `docker ps --no-trunc=true -a -q`

#http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html
#TODO: Add a confirm here
docker-remove-untagged-images:	
	docker rmi `docker images | grep "^<none>" | awk "{print $3}"`

#http://techoverflow.net/blog/2013/10/22/docker-remove-all-images-and-containers/
#TODO: Add a confirm here
docker-remove-all-images: 
	docker rmi `docker images`

docker-reset: docker-remove-all-containers docker-remove-all-images
	#other things we can reset?

docker-attach:
	#Example) docker-attach CONTAINER=web_server
	#Example) make docker-attach CONTAINER=c1997df1e28
	sudo lxc-attach -n $(shell sudo docker inspect ${CONTAINER} | grep '"ID"' | sed 's/[^0-9a-z]//g') /bin/bash

docker-setup-lxc:
	#Set Docker version 0.9 to use lxc
	echo "This will install lxc and also change the docker init to use lxc for docker 0.9+"
	sudo apt-get -y install lxc
	sudo cp ./scripts/docker.init.sh /etc/init.d/docker
	sudo service docker restart