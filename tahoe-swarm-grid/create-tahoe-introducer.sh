#!/bin/sh
#This bash script start a docker swarm stack of an introducer node.

TAHOE_LOG_DIR=/opt/tahoe/introducer/log
TAHOE_TUB_PORT=20000
 
export TAHOE_LOG_DIR
export TAHOE_TUB_PORT

mkdir -p ${TAHOE_LOG_DIR}

docker stack deploy tahoe-introducer -c $PWD/tahoe-grid-services/compose_tahoe_introducer.yml
