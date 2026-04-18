#!/bin/bash

echo "------------------------------------------"
echo "Starting Deployment..."
echo "------------------------------------------"

docker-compose down

docker-compose up -d

echo "------------------------------------------"
echo "Deployment Finished. App is running on Port 80."
echo "------------------------------------------"
