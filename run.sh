#!/usr/bin/env bash

# Run once to perform initial sync
echo "Performing intial sync"
/usr/bin/apt-mirror

# Start cron to force nightly syncs
echo "Starting cron for subsequent syncs"
cron

# Start nginx to begin serving the mirror
echo "Starting webserver"
nginx

multitail /var/log/nginx/trusty-mirror.access.log /var/log/nginx/trusty-mirror.error.log 
