#!/usr/bin/env bash

#Increase the virtual memory (Elasticsearch won start if itś less than 262144)
sysctl -w vm.max_map_count=262144

#Start the docker stack
docker stack deploy -c config/stack.yml "elasticsearch$1"

