#!/bin/bash

# ------------------------------------------------------------------------------
# archive-prod.sh
#
# Copy server files locally.
# ------------------------------------------------------------------------------

set -e

IP="107.170.164.113"
USER="root"
SSH_KEY="/home/mcl/.ssh/digitalocean"
REMOTE_DIR="/var/www/internalpointers-1"

rsync \
	--archive \
	--verbose \
	--progress \
	--compress \
	-e 'ssh -i '$SSH_KEY \
    "$USER"@"$IP":"$REMOTE_DIR" ./archive
