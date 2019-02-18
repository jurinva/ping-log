#!/bin/bash

hostsfile=$1
logfile=$2

function tsping() {
  fping $1
  if [ $? -ne 0 ]
    then D=`date '+%Y-%m-%d %H:%M:%S'`; M="$I not ping"; echo "$D $M"; echo "$D $M" >> /tmp/$logfile-notping.txt
    else D=`date '+%Y-%m-%d %H:%M:%S'`; M="$I ping"; echo "$D $M"; echo "$D $M" >> /tmp/$logfile-ping.txt
  fi
}

while true; do
  for I in `cat ~/tlilist.txt`; do
    tsping &
  done
done
