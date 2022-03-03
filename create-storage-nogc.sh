#!/bin/sh
#This bash script start a docker swarm stack of tahoe-LAFS storage node.
#In order to be a valid target for the deployement, the label tahoe.storage = true must be set on docker nodes

SERVICE_URL=test_url
TAHOE_CFG_DIR=/opt/tahoe/storage/config
TAHOE_STORAGE_DIR=/opt/tahoe/storage/data
TAHOE_TUB_PORT=20000

export SERVICE_URL
export TAHOE_CFG_DIR
export TAHOE_STORAGE_DIR
export TAHOE_TUB_PORT

mkdir -p ${TAHOE_CFG_DIR}
mkdir -p ${TAHOE_STORAGE_DIR}

docker stack deploy tahoe_${SERVICE_URL} -c $PWD/compose_docker/compose_init_storage.yml

docker stack deploy tahoe_${SERVICE_URL} -c $PWD/compose_docker/compose_run_storage.yml
