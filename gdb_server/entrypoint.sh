#! /bin/sh

flag=`echo $RANDOM | md5sum | head -c 20; echo`
export FLAG=$flag