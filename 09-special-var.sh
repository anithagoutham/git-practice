#!/bin/bash

echo " all variables passed to the script: $@"
echo " how many variables passed to the script: $#"
echo " how to check our script name: $0"
echo " to check current working directory: $PWD"
echo " to check home directory: $home"
echo " to check pid: $$"
sleep 100 &

echo " pid of last background command: $!"