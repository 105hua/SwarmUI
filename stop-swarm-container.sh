#!/bin/bash

# Check if the Docker daemon is running
if ! docker info >/dev/null 2>&1; then
  echo "Docker daemon is not running."
  exit 1
fi

# Check if the "swarmui" container is running
if docker inspect -f "{{.State.Running}}" swarmui >/dev/null 2>&1; then
  # If running, stop it
  docker stop swarmui
  docker rm swarmui
  echo "The SwarmUI Container has been stopped and removed."
else
  # If not running, print a message
  echo "The SwarmUI Container does not appear to be running."
fi