#!/bin/bash

CONTAINER_NAME="mysql"
SQL_FILE="/home/ubuntu/db/nm-gmt.sql"
CONTAINER_PATH="/tmp/nm-gmt.sql"
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=appdb
MYSQL_USER=appuser
MYSQL_ROOT_USER=root
MYSQL_PASSWORD=StrongPassword123

if [ ! -f "$SQL_FILE" ]; then
  echo "Error : SQL file not found!"
  exit 1
fi

echo "Copying SQL file to Container..."
docker cp "$SQL_FILE" "$CONTAINER_NAME":"$CONTAINER_PATH"

if [ $? -ne 0 ]; then
  echo "Error: Failed to copy file to container."
  exit 1
fi

echo "Importing SQl file to DB inside the Containers..."
docker exec -i "$CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$SQL_FILE"

if [ $? -eq 0 ]; then
  echo "Database imported successfully."
else
  echo "Error: Failed to import database."
fi
