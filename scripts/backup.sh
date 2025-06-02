#!/bin/bash

# ------------------------------------------------------------------------------
# backup.sh
# 
# backup server data to local folder.
# ------------------------------------------------------------------------------

USER="root"
IP="107.170.164.113"
SSH_KEY="/home/mcl/.ssh/digitalocean"
DATE=$(date +"%Y-%m-%d-%H:%M")

# phpbb backup

echo "exporting database"
ssh -i "$SSH_KEY" "$USER"@"$IP" \
	'mysqldump --no-tablespaces -u internalpointers -p internalpointers' > ../backup/internalpointers-"$DATE".sql

exit 0
