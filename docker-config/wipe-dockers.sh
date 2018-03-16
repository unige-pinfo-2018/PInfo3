#!/bin/bash

# delete all docker containers
if [[ $(docker ps -a -q) != "" ]]; then
	docker rm $(docker ps -a -q)
fi

# delete all docker images
if [[ $(docker images -a -q) != "" ]]; then
	docker rmi -f $(docker images -a -q)
fi
