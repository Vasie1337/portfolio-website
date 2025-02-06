#!/bin/bash

if [ "$1" ]; then
    # If service name is provided, rebuild that service
    echo "Rebuilding $1..."
    docker compose up -d --build "$1"
else
    # Otherwise rebuild all services
    echo "Rebuilding all services..."
    docker compose up -d --build
fi 