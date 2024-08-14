#!/bin/bash

datestr=`TZ=America/New_York date "+%Y%m%d%H%M"`

logfile=/usr/local/projects/cron_log/cron_${datestr}.log

/usr/local/projects/processAllHourly.sh > "$logfile"  2>&1

