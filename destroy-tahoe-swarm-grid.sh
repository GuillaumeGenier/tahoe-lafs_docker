#!/bin/sh
#This bash script destroy a docker swarm stack of tahoe-LAFS storage nodes.
#The logs volume need to be cleaned by hand oin the nodes in the swarm for now.

docker stack rm tahoe-grid 
docker network rm tahoe-grid-network