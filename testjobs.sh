#!/bin/bash

export LD_LIBRARY_PATH=/home/colin/safeqp
cd /home/colin/safeqp
rm parity[1-9]*

cd r
rm testcorr
R --no-save < getcorrected.R
cd ..

#julia jin.jl

../nonlineartune/covmaker -s0 ../webby/corr1
#../nonlineartune/covmaker -s0 ../webby/corrected
../nonlineartune/covmaker -s3 ../webby/corr1
#../nonlineartune/covmaker -s3 ../webby/corrected
#../nonlineartune/covmaker -s2 ../webby/corr1
#../nonlineartune/covmaker -s2 ../webby/corrected

ls -alFH --time-style=+%d-%m-%Y\ %T parity1* > ttt
cp -p ttt ttt1

for i in $(awk '{print $NF}' ttt)
do sed -i "/seq/,+1s/[0123]/2/" $i
if ./readin.pl < $i
then 
  echo $i true
else 
  echo $i
  sed -i "/$i/d" ttt
fi
done

for i in $(diff -c ttt1 ttt | awk '/^- /{print $NF}')
do
echo $i
cp -p $i ../problems
done


for pp in parity1*;do echo $pp | sed "s/parity//;s/.log//"|awk '{print "touch --date='\''@"$1"'\'' parity"$1".log"}';done |bash
cd ../problems
for pp in parity1*;do echo $pp | sed "s/parity//;s/.log//"|awk '{print "touch --date='\''@"$1"'\'' parity"$1".log"}';done |bash
cd ../safeqp
