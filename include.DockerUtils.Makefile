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
	#Example) docker-attach CONTAINER=postgresql_server
	#Example) make docker-attach CONTAINER=c1997df1e28
	sudo lxc-attach -n $(shell docker inspect --format='{{.ID}}' ${CONTAINER}) /bin/bash

docker-setup-lxc:
	#Set Docker version 0.9 to use lxc
	echo "This will install docker, lxc and also change the docker init to use lxc for docker 0.9+"
	#Add in docker repository to apt-get
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
	#Update and upgrade
	sudo apt-get update
	sudo apt-get -y upgrade
	#Install AUFS
	sudo apt-get install linux-image-extra-`uname -r`
	sudo apt-get -y install lxc-docker
	#Configure docker and add in custom lxc conf
	-sudo groupadd docker
	-sudo usermod -a -G docker ${USER}
	sudo apt-get -y install lxc
	sudo cp ./scripts/docker.init.sh /etc/init.d/docker
	sudo cp ./scripts/docker.conf /etc/init/docker.conf
	sudo chmod +x /etc/init.d/docker
	sudo service docker restart
