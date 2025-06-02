#!/bin/bash

# ----------------------------------------------------------------------
# clear-cache.sh
# 
# delete remote cache.
# ----------------------------------------------------------------------

if [[ -z "$1" ]]; then
  echo "missing cache file to delete."
  echo "usage: clear-cache.sh <[file]|all>"
  exit 1
fi

FILE="$1"
USER="root"
IP="107.170.164.113"
SSH_KEY="/home/mcl/.ssh/digitalocean"

if [[ "$1" == "all" ]]; then
	ssh -i "$SSH_KEY" "$USER"@"$IP" rm /var/www/internalpointers/data/cache/*
else
	ssh -i "$SSH_KEY" "$USER"@"$IP" rm /var/www/internalpointers/data/cache/"$FILE"
fi

#
