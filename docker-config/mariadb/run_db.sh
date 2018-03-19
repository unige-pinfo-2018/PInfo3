#!/bin/bash

CONT_NAME="mariadb-prod"

# Remove when docker secret is up
PW="Pinfo2018"

if [[ "$(docker images -q mariadb-prod 2> /dev/null)" == "" ]]; then
        docker build -t mariadb-prod .
fi


if [[ "$(docker ps -a -q -f "name=$CONT_NAME" 2> /dev/null)" != "" ]]; then
        docker start $CONT_NAME
else
	docker run -d -v mariadb-data:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=$PW --name $CONT_NAME mariadb-prod
fi
