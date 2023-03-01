#! /bin/bash

envFlag=$FLAG
flag1=${envFlag:0:${#envFlag}/2}
flag2=${envFlag:${#envFlag}/2}
mkdir -p /stuff /share
echo $flag1 > /stuff/flag1.txt
echo $flag2 > /share/flag2.txt

exec "$@"