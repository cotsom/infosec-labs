#! /bin/sh

flag=`echo $RANDOM | md5sum | head -c 20; echo`
export SECRET=$flag
echo "TESTTESTTETSTESTESTT"
while true; do sleep 1; done