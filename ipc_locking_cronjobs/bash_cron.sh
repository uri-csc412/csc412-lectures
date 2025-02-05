#!/bin/bash

# our lock file
L="/var/run/my_cron_job.lock"

# check if the lock file exists
if [ -e "$L" ]; then
    echo "another instance is running."
    exit 1
fi

# create the lock file with the current PID
echo $$ > "$L"

# you could put your other code here
### maybe you have a web server, and 
### you are regenerating you static HTML website

# remove (rm) the lock file
rm "$L"
