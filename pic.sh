#!/bin/bash
pic=/home/colin/Pictures/new`date +%H`.jpg
echo $pic
avconv -f video4linux2 -s 640x480 -i /dev/video0 -ss 2 -frames 1 pic.jpg &
sleep 10
procconv=$!
ps -e | grep avconv
echo $procconv
mv pic.jpg $pic
if [ `ls -l $pic | awk '{print $5}'` -lt 10000 ]
then 
  echo Deleting $pic
  rm $pic 
fi
kill $procconv
