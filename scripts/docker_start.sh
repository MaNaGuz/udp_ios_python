#!/usr/bin/bash

PORT=$1

docker run -p $PORT:$PORT/udp -e PORT=$PORT --name my_udp_receiver udp_receiver

echo "Stopping Container"
docker rm -f my_udp_receiver