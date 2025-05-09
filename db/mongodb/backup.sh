#!/bin/bash
 
APP_NAME="dev-db"
BACKUPS_DIR="/home/user/snapshots"
TIMESTAMP=`date +%F-%H%M`
BACKUP_NAME="$BACKUPS_DIR/$APP_NAME-$TIMESTAMP.gz"

MONGO_HOST="localhost"
MONGO_PORT="27017"

DAYSTORETAINBACKUP="5"

mongodump --host $MONGO_HOST --archive=$BACKUP_NAME --gzip

#===========================LIFE CYCLE================================
find $BACKUPS_DIR -type f -mtime +$DAYSTORETAINBACKUP -exec rm {} +
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Database backup complete!"
