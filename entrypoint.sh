#!/bin/sh

if [ ! -f /app/backup.sh ];
then
  echo "ERROR: /app/backup.sh not found!";
  exit 1;
fi

chmod +x /app/backup.sh;
echo "${BACKUP_CRON:-0 3 * * *} /app/backup.sh >> /tmp/backup.log 2>&1" > /etc/crontabs/root;

"$@"
