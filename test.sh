#!/bin/bash


docker build -t cassandra .
for i in 1 2 3 ; do
    docker stop cas${i}
    docker rm cas${i}
    docker run -d -e ENABLE_TLS=1 -v /var/lib/cassandra${i}:/var/lib/cassandra -v /etc/cassandra/conf${i}:/etc/cassandra/conf/ --name cas${i} cassandra
done
docker exec cas1 cat /etc/cassandra/cassandra.yaml
