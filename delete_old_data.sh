#!/bin/bash

echo "Running delete script at $(date)" >> ~/data_retention_project/delete_data.log

DATA_DIR="$HOME/data_retention_project/logs"
RETENTION_DAYS=2
find "$DATA_DIR" -type f -mtime +$RETENTION_DAYS -exec rm {} \;

echo "Deleted files older than $RETENTION_DAYS days from $DATA_DIR" >> ~/data_retention_project/delete_data.log

# Healthchecks.io ping
curl -fsS --retry 3 https://hc-ping.com/ce845ecd-6546-4fb6-b97a-e7d69cbdcc45 > /dev/null
