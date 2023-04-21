#!/bin/bash

# Define Variables
recipient="administrator@DOMAIN.SOMETHING"
subject="VPS Login Alert"
body="Someone has just logged in to the VPS"

# Monitor auth.log file for login events
tail -f /var/log/auth.log | while read LINE
do
    echo $LINE | grep "session opened for user" #> /dev/null
    if [[ $? == 0 ]]; then
        # Extract username from log message
        USER=$(echo $LINE | awk '{print $11}')

        # Send email notification with username
        echo "Someone has just logged in to the Server. Username: $USER" | mail -s "$subject" $recipient
    fi
done
