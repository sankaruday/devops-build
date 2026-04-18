#!/bin/bash

echo "------------------------------------------"
echo "Cleaning up old containers..."
echo "------------------------------------------"

# Force stop and remove the container if it exists
docker rm -f trend-store-container || true

echo "------------------------------------------"
echo "Starting Deployment..."
echo "------------------------------------------"

# Start the new container using your docker-compose
docker-compose up -d

echo "------------------------------------------"
echo "Deployment Finished. App is running on Port 80."
echo "------------------------------------------"
