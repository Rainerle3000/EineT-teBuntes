#! /bin/bash
set -x-v

ping -c 5 8.8.8.8 > extping.txt

DATE=$(date +"%Y%m%d%H%M")
mv extping.log ./external_ping_logs/$DATE.log
echo Moved with time
