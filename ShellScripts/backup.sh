#!/bin/bash

# Author: Rahul Pokhariyal
# Script: Directory Backup Automation

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_${TIMESTAMP}.tar.gz"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$BACKUP_DIR/$BACKUP_FILE" | awk '{print $1}')
    RESULT="SUCCESS: $BACKUP_FILE ($SIZE)"
    echo "Backup created successfully: $BACKUP_FILE"
    echo "Backup size: $SIZE"
else
    RESULT="FAILED: $BACKUP_FILE"
    echo "Error: Backup failed."
    exit 1
fi

echo "$(date): $RESULT" >> "$BACKUP_DIR/backup.log"
