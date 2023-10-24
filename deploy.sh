#!/bin/bash

echo "Starting to deploy docker image.."
docker pull $DOCKER_REPO/$DOCKER_IMAGE:latest
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop
docker run -d -p $APP_PORT:$APP_PORT $DOCKER_IMAGE
