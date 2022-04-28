#!/bin/sh
#This bash script start a docker swarm stack of tahoe-LAFS storage node.
#In order to be a valid target for the deployement, the label tahoe.storage = true must be set on docker nodes

TAHOE_LOG_DIR=/opt/tahoe/storage/log
TAHOE_STORAGE_DIR=/opt/tahoe/storage/data
TAHOE_TUB_PORT=20000

TAHOE_INTRODUCER_FURL=pb://3b36flsair4yqc2xi63jvnzzwfiy23cl@tcp:test:38771/jpwpdlzkpqqpyziqanjkhtoewp7bd6ni

export TAHOE_LOG_DIR
export TAHOE_STORAGE_DIR
export TAHOE_TUB_PORT
export TAHOE_INTRODUCER_FURL


mkdir -p ${TAHOE_LOG_DIR}
mkdir -p ${TAHOE_STORAGE_DIR}

docker stack deploy tahoe -c $PWD/compose_docker/compose_init_storage.yml

sleep 3

docker stack deploy tahoe -c $PWD/compose_docker/compose_run_storage.yml
