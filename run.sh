#!/usr/bin/env bash

# Start nginx to begin serving the mirror
echo "Starting webserver"
nginx -g 'daemon off;' &

# Run once to perform initial sync
echo "Performing intial sync"
/usr/bin/apt-mirror

# Start cron to force nightly syncs
# Don't start cron before the first call to apt-mirror
# finishes since it can take a very long time.  I'm assuming
# running multiple apt-mirror's would not be good
echo "Starting cron for subsequent syncs"
cron


# Wait for the webserver... forever
wait
