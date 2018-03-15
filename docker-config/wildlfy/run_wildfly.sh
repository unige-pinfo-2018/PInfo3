#!/bin/bash

CONT_NAME="elasticsearch-cozmo"


echoerr() { echo "$1" 1>&2; }

if [[ "$(docker images -q wildfly-prod 2> /dev/null)" == "" ]]; then
        docker build -t wildfly-prod .
fi

docker run -d -p 8080:8080 -p 9990:9990 -p 8787:8787 -v wildfly-deployments:/opt/jboss/wildfly/standalone/deployments/ wildfly-prod
