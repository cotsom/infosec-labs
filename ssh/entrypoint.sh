#! /bin/sh

flag=`echo $RANDOM | md5sum | head -c 20; echo`
echo $flag > /home/flag.txt
while true; do sleep 1; done