#!/bin/bash

echo "Running at $(date)" >> ~/data_retention_project/save_data.log

DATA_DIR="$HOME/data_retention_project/logs"
FILENAME="log_$(date +'%Y-%m-%d_%H-%M-%S').txt"
echo "This is a sample log generated at $(date)" > "$DATA_DIR/$FILENAME"
echo "Saved log file: $FILENAME" >> ~/data_retention_project/save_data.log

# Healthchecks.io ping
curl -fsS --retry 3 https://hc-ping.com/d08fb32b-7266-43c2-a2aa-509f19ee4e99 > /dev/null
