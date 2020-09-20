#!/bin/bash

cmd=$1
logfile=$2

if [[ $cmd == ""  ]] || [[ $logfile == "" ]] ; then
  echo "usage: log command path"
else

  datetime=`date '+%Y-%m-%d %H:%M'`

  if $cmd >/dev/null 2>>$logfile ; then 
    echo  "$datetime $cmd OK" >> $logfile
  else 
    echo  "$datetime $cmd KO" >> $logfile
  fi
fi


