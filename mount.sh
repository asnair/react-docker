#This is for mounting volumes into docker-machine, then from docker-machine into the container within the linux host in virtualbox so it can see the node modules and avoid the missing files error. Find more info at https://docs.docker.com/machine/reference/mount/ and https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container

docker-machine mount ${PWD}:/usr/src/app app
docker-machine mount /usr/src/app/node_modules
