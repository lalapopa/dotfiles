BACKUP_PATH="/home/lalapopa/Lab/backup-test"
mkdir /tmp/immich-mountpoint
borg mount -o allow_other -f "$BACKUP_PATH"/immich-borg /tmp/immich-mountpoint
cd /tmp/immich-mountpoint
