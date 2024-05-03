#!/bin/bash
now=$(date +%s)
for i in *original.m4a
do
filetime=$(ls -l --time-style=+%s $i | awk '{print $6}')
#echo $i,$filetime,$now,$filetime
daytest=$(echo $now,$filetime | awk -F, '{print int(($1-$2)/60/60/24)}')
#echo $i $daytest
if [ $daytest -gt 30 ] 
then
echo deleting $i $daytest
rm $i
fi
done
