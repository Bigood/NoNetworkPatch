#!/bin/bash
sb_exec=`which sandbox-exec`
#Check sandbox-exec's here
if [[ sb_exec == '' ]]; then
	echo '[Error] No sandbox-exec found in /usr/bin : please copy it from ./bin'
	echo 'Using version from ./bin instead'
	sb_exec='./bin/sandbox-exec'
	exit
fi
sb_simplify=`which sandbox-simplify`
#Check sandbox-simplify's here (removed from OSX 10.11)
if [[ sb_simplify == '' ]]; then
	echo '[Error] No sandbox-simplify found in /usr/bin : please copy it from ./bin'
	echo 'Using version from ./bin instead'
	sb_simplify='./bin/sandbox-simplify'
	exit
fi


app_path=$1
profile_name=`basename $app_path`

#Generate trace
$sb_exec -f ./profiles/trace.sb $app_path &

sleep 2

$sb_simplify ./profiles/trace_output_tmp.sb > ./profiles/$profile_name.sb

rm ./profiles/trace_output_tmp.sb

echo 'Seatbelt created : ./profiles/'$profile_name'.sb'
