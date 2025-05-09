#!/bin/sh

# Run as sudo bc stupid immich library created as root I guess

# Paths
UPLOAD_LOCATION="/home/lalaserver/Lab/immich/library"
BACKUP_PATH="/home/lalaserver/Lab/backup"

### Local
# Backup Immich database
docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres > "$UPLOAD_LOCATION"/database-backup/immich-database.sql
# For deduplicating backup programs such as Borg or Restic, compressing the content can increase backup size by making it harder to deduplicate. If you are using a different program or still prefer to compress, you can use the following command instead:
# docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres | /usr/bin/gzip --rsyncable > "$UPLOAD_LOCATION"/database-backup/immich-database.sql.gz

### Append to local Borg repository
borg create "$BACKUP_PATH/immich-borg::{now}" "$UPLOAD_LOCATION" --exclude "$UPLOAD_LOCATION"/thumbs/ --exclude "$UPLOAD_LOCATION"/encoded-video/
borg prune --keep-weekly=4 --keep-monthly=3 "$BACKUP_PATH"/immich-borg
borg compact "$BACKUP_PATH"/immich-borg
