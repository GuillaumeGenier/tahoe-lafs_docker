#!/bin/sh
#This bash script destroy a docker swarm stack of tahoe-LAFS storage nodes.
#The logs volume need to be cleaned by hand oin the nodes in the swarm for now.

docker stack rm tahoe-sftp

docker stack rm tahoe-introducer

docker stack rm tahoe-storage

docker stack rm tahoe-http-debug

