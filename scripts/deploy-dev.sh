#!/bin/bash

# ------------------------------------------------------------------------------
# deploy-dev.sh
#
# Copy project from ../www to local development server.
# ------------------------------------------------------------------------------

set -e

IP="192.168.56.4"
USER="mcl"
PASSWORD="mcl"
REMOTE_DIR="/var/www/internalpointers"

# Compile

nodejs ../www/build.js dev

# Copy all files to server

sshpass -p"$PASSWORD" rsync \
  --delete \
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
  -e 'ssh ' \
  ../www/build/ "$USER"@"$IP":"$REMOTE_DIR"
