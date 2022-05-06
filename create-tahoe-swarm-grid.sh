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

mkdir -p ${TAHOE_STORAGE_DIR}

docker network create -d overlay --attachable tahoe-grid-network

docker stack deploy tahoe-grid \
-c $SCRIPT_DIR/tahoe-swarm-grid/tahoe-services-composes/compose-tahoe-storage.yml \
-c $SCRIPT_DIR/tahoe-swarm-grid/tahoe-services-composes/compose-tahoe-introducer.yml \
-c $SCRIPT_DIR/tahoe-swarm-grid/tahoe-services-composes/compose-tahoe-client-http.yml \
-c $SCRIPT_DIR/tahoe-swarm-grid/tahoe-services-composes/compose-tahoe-client-sftp.yml
