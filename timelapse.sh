#!/bin/bash
limit=40
now=$(date +%s)
for i in *original.m4a *original.mp4 "Brown*.m4a"
do
filetime=$(ls -l --time-style=+%s $i | awk '{print $6}')
#echo $i,$filetime,$now,$filetime
daytest=$(echo $now,$filetime | awk -F, '{print int(($1-$2)/60/60/24)}')
#echo $i $daytest
if [ $daytest -gt $limit ] 
then
echo deleting $i $daytest
rm $i
fi
done
