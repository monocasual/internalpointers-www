#!/bin/bash

# ------------------------------------------------------------------------------
# import-prod-db.sh
#
# Import a db from production to development.
#
#		./import-prod-db.sh [path-to-db-dump]
# ------------------------------------------------------------------------------

USER="mcl"
IP="192.168.56.4"
PASSWORD="mcl"
DB_USER="internalpointers"
DB_PASS="" # not needed here, dev db is passwordless
DB_NAME="internalpointers"

if [ ! -f "$1" ]; then
  echo "db dump not found, nothing to do."
  exit 1
fi

DB_DUMP_FILEPATH=$1 
DB_DUMP_FILENAME=${1##*/} # basename

sshpass -p"$PASSWORD" scp "$DB_DUMP_FILEPATH" "$USER"@"$IP":/home/"$USER"
sshpass -p"$PASSWORD" ssh "$USER"@"$IP" bash -c "'mysql -u $DB_USER $DB_NAME < /home/$USER/$DB_DUMP_FILENAME'"
sshpass -p"$PASSWORD" ssh "$USER"@"$IP" bash -c "'rm /home/$USER/$DB_DUMP_FILENAME'"
