BACKUP_PATH="/mnt/media/Lab/immich"
mkdir /mnt/media/tmp/immich-mountpoint
borg mount -o allow_other -f "$BACKUP_PATH"/immich-borg /mnt/media/tmp/immich-mountpoint
cd /mnt/media/tmp/immich-mountpoint
