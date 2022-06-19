#!/bin/sh
#This bash script start a docker swarm stack of tahoe-LAFS storage nodes.
#In order to be a valid target for the deployement of storage node, the label tahoe.storage = true must be set on docker nodes in the swarm

SCRIPT_DIR=$(dirname $(realpath $0))

TAHOE_STORAGE_DIR=/opt/tahoe/
TAHOE_TUB_PORT=20000
TAHOE_WEB_PORT=8080
TAHOE_SSH_PORT=221

echo $SCRIPT_DIR
export TAHOE_STORAGE_DIR
export TAHOE_TUB_PORT
export TAHOE_WEB_PORT
export TAHOE_SSH_PORT

#Execute this commands on all the storage nodes
#mkdir -p ${TAHOE_STORAGE_DIR}

docker network create -d overlay --attachable tahoe-grid-network

docker stack deploy tahoe-storage -c $SCRIPT_DIR/swarm-grid/server-storage/compose-tahoe-storage.yml

docker stack deploy tahoe-introducer -c $SCRIPT_DIR/swarm-grid/server-introducer/compose-tahoe-introducer.yml

docker stack deploy tahoe-http-debug -c $SCRIPT_DIR/swarm-grid/client-http/compose-tahoe-client-http.yml 

#docker stack deploy tahoe-sftp -c $SCRIPT_DIR/swarm-grid/client-sftp/compose-tahoe-client-sftp.yml
