#!/bin/bash

#Check sandbox-exec's here
if [[ `which sandbox-exec` == '' ]]; then
	echo 'No sandbox-exec found in /usr/bin : please copy it from ./bin before retrying.'
	exit
fi

#echo 'Using sandbox-exec : ' `which sandbox-exec`

app_path=$1

#Use buclkeup to patch app
log=`./buckleup.py -p nonet -a $app_path`

echo $log

#Keep a log of patched apps (dedupe and add entry)
sed '/$app_path/d' ./patched_apps.txt > ./patched_apps.txt
echo $app_path >> patched_apps.txt