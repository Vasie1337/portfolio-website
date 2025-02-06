#!/bin/bash

# Create network if it doesn't exist
if ! docker network ls | grep -q traefik-public; then
    echo "Creating traefik-public network..."
    docker network create traefik-public
fi

# Create letsencrypt directory if it doesn't exist
if [ ! -d "letsencrypt" ]; then
    echo "Creating letsencrypt directory..."
    mkdir letsencrypt
fi

# Start services in detached mode
echo "Starting services..."
docker compose up -d

echo "Services are starting up. Use './logs.sh' to view logs." 