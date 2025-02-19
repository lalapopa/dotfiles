UPLOAD_LOCATION="/home/lalapopa/Lab/immich/library"       # Immich database location, as set in your .env file
BACKUP_PATH="/home/lalapopa/Lab/backup"

mkdir "$UPLOAD_LOCATION/database-backup"
borg init --encryption=none "$BACKUP_PATH/immich-borg"
