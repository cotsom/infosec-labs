#! /bin/sh

flag=`echo $RANDOM | md5sum | head -c 20; echo`
mkdir -p /share
echo $flag > /share/flag.txt
#while true; do sleep 1; done