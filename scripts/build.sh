#!/bin/sh

# set -euo pipefail
set -e

WD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $WD

docker build -t udp_receiver -f ../Dockerfile ..