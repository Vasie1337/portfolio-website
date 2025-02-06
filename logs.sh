#!/bin/bash

if [ "$1" ]; then
    # If service name is provided, show logs for that service
    echo "Showing logs for $1..."
    docker compose logs -f "$1"
else
    # Otherwise show all logs
    echo "Showing all logs..."
    docker compose logs -f
fi 