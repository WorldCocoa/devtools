
clone-all: 
	./scripts/clone-all.sh

add-repos: 
	#Make sure all the repo directories are there, if not then add them in
	test -d docker-ubuntu-base || git clone  docker-ubuntu-base
	test -d globallometree || git clone add  globallometree
	test -d docker-postgresql || git clone add  docker-postgresql
	test -d docker-elasticsearch || git clone add  docker-elasticsearch

list-submodules:
	cat .gitmodules

