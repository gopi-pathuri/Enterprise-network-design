#!/bin/bash
# backup-configs.sh
# Simple script to simulate backing up network configurations

BACKUP_DIR="./backups/$(date +%Y%m%d)"
mkdir -p "$BACKUP_DIR"

echo "Starting configuration backup..."

# Simulated backup loop
for device in Core-SW1 Dist-R1 Access-SW1; do
    echo "Backing up $device..."
    # In a real scenario, this would use scp or snmp
    # scp admin@$device:running-config $BACKUP_DIR/$device.cfg
    sleep 1
    echo "  [OK] $device config saved to $BACKUP_DIR/$device.cfg"
done

echo "Backup completed successfully."
