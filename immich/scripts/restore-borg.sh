BACKUP_PATH="/home/lalaserver/Lab/backup"
mkdir /tmp/immich-mountpoint
borg mount -o allow_other -f "$BACKUP_PATH"/immich-borg /tmp/immich-mountpoint
cd /tmp/immich-mountpoint
