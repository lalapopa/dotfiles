UPLOAD_LOCATION="/home/lalaserver/Lab/immich/library"       # Immich database location, as set in your .env file
BACKUP_PATH="/home/lalaserver/Lab/backup"

mkdir "$UPLOAD_LOCATION/database-backup"
borg init --encryption=none "$BACKUP_PATH/immich-borg"
