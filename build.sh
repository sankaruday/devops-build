#!/bin/bash

DOCKER_USER="your_dockerhub_username"
IMAGE_NAME="dev-image"
TAG="latest"

echo "------------------------------------------"
echo "Starting Docker Build: $IMAGE_NAME:$TAG"
echo "------------------------------------------"

docker build -t $DOCKER_USER/$IMAGE_NAME:$TAG .

echo "------------------------------------------"
echo "Build Completed Successfully"
echo "------------------------------------------"
