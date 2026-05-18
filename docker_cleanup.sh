#!/bin/bash

echo "Processing Begins ..."

sleep 3

echo "Stop All Running Containers"

docker stop $(docker ps -aq)

echo "Remove All Containers"

docker rm $(docker ps -aq)

echo "Remove All Docker Images"

docker rmi -f $(docker images -aq)

echo "Remove All Volumes"

docker volume rm $(docker volume ls -q)

echo "Remove All Networks"

docker network prune -f

echo "Remove Build Cache"

docker builder prune -a -f

echo "Complete Docker Cleanup"

docker system prune -a --volumes -f

echo "Clean Node Modules Cache"

npm cache clean --force

echo "Remove Unused Temporary Files"

sudo rm -rf /tmp/*`
