#!/bin/sh

# set -euo pipefail
#set -e

WD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $WD

docker build -t udp_receiver -f ../Dockerfile ..

echo "Image built"

PORT=$1

docker run -p $PORT:$PORT/udp -e PORT=$PORT --name my_udp_receiver udp_receiver

echo "Stopping Container"
docker rm -f my_udp_receiver