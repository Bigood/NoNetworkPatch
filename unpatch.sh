#!/bin/bash

app_path=$1

#Use buclkeup to patch app
log=`./buckleup.py -u nonet -a $app_path`

echo $log

#Keep a log of patched apps (removes the entry from log)
sed '/$app_path/d' ./patched_apps.txt > ./patched_apps.txt
