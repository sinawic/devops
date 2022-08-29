#!/bin/sh

# make a file for a long time ago
# touch -d 20120101 goldenfile2

dir_to_check='./old'

last_month=$(date -d "-1 month -$(($(date +%d)-$(date +%d))) days" +%Y-%m-%d)

find "$dir_to_check" ! -newermt "$last_month" -type f -exec rm {} \;

# find $dir_to_check -mtime +30 -type f ! -name '*-01.zip' -delete