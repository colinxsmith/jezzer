#!/bin/sh

#Edit out an interval in sound, doing a direct copy i.e. for m4a to m4a etc.

st='0'
fin='0'
ti='0'

ss=0

if [ $# -eq 0 ]
then
echo "No arguments have been given;"\\n"should have $0 -s start -f finish input output"\\n"(or -t time length instead of -f finish)"
exit 1
elif [ $# -eq 1 ]
then
echo "Only $# argument has been given;"\\n"should have $0 -s start -f finish input output"\\n"(or -t time length instead of -f finish)"
exit 1
elif [ $# -lt 6 ]
then
echo "Only $# arguments have been given;"\\n"should have $0 -s start -f finish input output"\\n"(or -t time length instead of -f finish)"
exit 1
fi

minuscount=0
#for i in $1 $2 $3 $4
#for i in $@
for i in $*
do
if [ $ss = '-s' ]
then
st=$i
ss=0
elif [ $ss = '-t' ]
then
ti=$i
ss=0
elif [ $ss = '-f' ]
then
fin=$i
ss=0
fi

if [ $i = '-s' ] || [ $i = '-f' ] || [ $i = '-t' ] 
then
ss=$i
minuscount=`echo $minuscount | awk '{print $1 + 1}'`
fi
done

if [ $minuscount -gt 2 ]
then
  echo "Greater than 2 arguments beginning with -"\\n"should have $0 -s start -f finish input output"\\n"(or -t time length instead of -f finish)"
 exit 1
elif [ $minuscount -lt 2 ]
then
  echo "Less than 2 arguments beginning with -"\\n"should have $0 -s start -f finish input output"\\n"(or -t time length instead of -f finish)"
  exit 1
fi

echo "`date +%d-%m-%Y_%T` $0 $*" >> ~/edit_tune.log

#echo $st,$ti,$fin

if ! [ $ti = '0' ]
then
echo $ti
ti=`echo $ti | awk -F ':' '{ if(NF==2){print $1*60+$2}else if(NF==3){print ($1*60+$2)*60+$3}else if(NF==1){print $1} }'`
echo "is $ti secs."
fi

if ! [ $fin = '0' ]
then
echo $fin
fin=`echo $fin | awk -F ':' '{ if(NF==2){print $1*60+$2}else if(NF==3){print ($1*60+$2)*60+$3}else if(NF==1){print $1} }'`
echo "is $fin secs."
fi

if ! [ $st = '0' ]
then
echo $st
st=`echo $st | awk -F ':' '{ if(NF==2){print $1*60+$2}else if(NF==3){print ($1*60+$2)*60+$3}else if(NF==1){print $1} }'`
echo "is $st secs."
fi


if [ $fin -eq 0 ]
then
fin=`echo "$st $ti" | awk '{ print $1+$2}'`
else
ti=`echo "$fin $st" | awk '{ print $1-$2 }'`
fi

echo "Start $st, Stop $fin, Time length $ti"

echo "ffmpeg -ss $st -i $5 -t $ti -codec: copy $6"
ffmpeg -ss $st -i $5 -t $ti -c copy $6
#ffmpeg -ss $st -i $5 -t $ti -codec: copy trans.aac
#ffmpeg -i trans.aac -codec: copy $6
#rm trans.aac
