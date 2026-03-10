#!/bin/sh

# set -euo pipefail
set -e

WD="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
cd $WD

export PYTHONPATH="../lib:../py:$PYTHONPATH"

python3 -m udp_receiver.app