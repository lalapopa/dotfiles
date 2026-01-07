UPLOAD_LOCATION="/mnt/media/Lab/immich/library"       # Immich database location, as set in your .env file
BACKUP_PATH="/mnt/media/Lab/immich"

mkdir -p "$UPLOAD_LOCATION/database-backup"
borg init --encryption=none "$BACKUP_PATH/immich-borg"
