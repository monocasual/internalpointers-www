#!/bin/bash

# ------------------------------------------------------------------------------
# deploy-prod.sh
#
# Copy project from local folder to server.
# ------------------------------------------------------------------------------

set -e

IP="107.170.164.113"
USER="root"
SSH_KEY="/home/mcl/.ssh/digitalocean"
REMOTE_DIR="/var/www/internalpointers-1"

read -p "WARNING: you are going to deploy your app in production. Are you sure? " -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	exit 0
fi

# Compile

nodejs ../www/build.js prod

# Push everything to server.

rsync \
	--archive \
	--verbose \
	--progress \
	--compress \
	--omit-dir-times \
	--no-owner \
	--no-perms \
	--no-group \
	--exclude '/cms/api' \
	--exclude '/cms/.git*' \
	-e 'ssh -i '$SSH_KEY \
	../www/build/ "$USER"@"$IP":"$REMOTE_DIR"
