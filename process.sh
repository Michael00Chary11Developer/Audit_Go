#!/bin/bash


containers=$(docker ps -q)


for container in $containers; do
    echo "Processing container $container"


    ppid=$(docker inspect --format '{{.State.Pid}}' $container)

    echo "PPID for container $container is $ppid"

    docker exec -it $container wget -O /var/log/audit/audit.log "http://your-log-server/path-to-logs"
done
