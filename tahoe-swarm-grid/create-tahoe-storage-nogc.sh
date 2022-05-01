#!/bin/sh
#This bash script start a docker swarm stack of tahoe-LAFS storage nodes.
#In order to be a valid target for the deployement, the label tahoe.storage = true must be set on docker nodes in the swarm

TAHOE_LOG_DIR=/opt/tahoe/storage/log
TAHOE_STORAGE_DIR=/opt/tahoe/storage/data
TAHOE_TUB_PORT=20000
 
export TAHOE_LOG_DIR
export TAHOE_STORAGE_DIR
export TAHOE_TUB_PORT

mkdir -p ${TAHOE_LOG_DIR}
mkdir -p ${TAHOE_STORAGE_DIR}

docker stack deploy tahoe-storage -c $PWD/tahoe-grid-services/compose_tahoe_storage.yml
