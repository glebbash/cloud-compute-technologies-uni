#!/bin/bash

# Define the source and destination
SOURCE_FILE="./index.php"
DESTINATION="/var/www/html/index.php"

# Check if the source file exists
if [ -f "$SOURCE_FILE" ]; then
    sudo cp "$SOURCE_FILE" "$DESTINATION"
    sudo chown www-data:www-data "$DESTINATION"
    sudo chmod 644 "$DESTINATION"
    echo "index.php copied to $DESTINATION."
else
    echo "Error: $SOURCE_FILE does not exist."
fi

# Start the Apache server
sudo systemctl start apache2
echo "Apache server started."
