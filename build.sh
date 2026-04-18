#!/bin/bash
# Variables
IMAGE_NAME="dev-image"
TAG="latest"

echo "Starting Docker Build: $IMAGE_NAME:$TAG"
docker build -t $IMAGE_NAME:$TAG .
echo "Build Completed Successfully"
