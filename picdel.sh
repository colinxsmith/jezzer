#!/bin/bash
cd ~/Pictures
for pic in *.jpg; do if [ `ls -l $pic | awk '{print $5}'` -lt 10000 ]; then echo Deleting $pic;rm $pic; fi; done
