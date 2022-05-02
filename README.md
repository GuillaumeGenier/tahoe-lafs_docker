# tahoe-lafs_docker
Deployement script for a Tahoe-LAFS grid from docker images.

This repository contains the necessary scripts to create a Tahoe-LAFS grid on a docker swarm cluster.

In order to do this, a base image of tahoe lafs is extended with  layers that specifiy the configurations for the nodes on the grid.

The image used for now is this developpement image from there :
https://hub.docker.com/r/derkades/tahoe-lafs 
