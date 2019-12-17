#!/bin/bash
day=`date +%a`
#echo $day
cd /home/colin/iplayer/get_iplayer-2.93
if [ $day == "Fri" ]
then
echo "It's Friday"
rm prog$day
./get_iplayer --type=liveradio --stream  "6 Music" > prog$day &
procjob=$!
echo "Process is $procjob"
sleep 7320
ls -l prog$day
kill  $procjob
#pkill -f perl
elif [ $day == "Mon" ]
then
echo "It's Monday"
rm prog$day
./get_iplayer --type=liveradio --stream  "BBC Radio 3" > prog$day &
procjob=$!
echo "Process is $procjob"
sleep 5520
ls -l prog$day
kill  $procjob
#pkill -f perl
elif [ $day == "Sat" ]
then
echo "It's Saturday"
rm prog$day
./get_iplayer --type=liveradio --stream  "6 Music" > prog$day &
procjob=$!
echo "Process is $procjob"
sleep 10920
ls -l prog$day
kill  $procjob
#pkill -f perl
elif [ $day == "Sun" ]
then
echo "It's Sunday"
rm prog$day
./get_iplayer --type=liveradio --stream  1Xtra > prog$day &
procjob=$!
echo "Process is $procjob"
sleep 7320
ls -l prog$day
kill  $procjob
#else
#rm prog$day
#./get_iplayer --type=liveradio --stream   1Xtra > prog$day &
#procjob=$!
#echo "Process is $procjob"
#sleep 100
#kill  $procjob
fi

#kill -9 `ps -e| awk '/ffmpeg/{ print $1 }'`

rm /home/colin/Music/prog$day.*
rm /home/colin/Music/*/prog$day.*
#ffmpeg -i prog$day -codec: copy /home/colin/Music/prog$day.m4a

echo "Time now $(date +\%T)"

ffmpeg -i prog$day -codec: copy /home/colin/Music/prog$day.aac

#cd /home/colin/Music

kill -9 `ps -e| awk '/mediatomb/{ print $1 }'`
sleep 30
#mediatomb -a /home/colin/Music &

#for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.m4a}.mp3";fi; done

#kill -9 `ps -e| awk '/mediatomb/{ print $1 }'`
#mv prog$day.mp3 mp3
#mv prog$day.m4a m4a
#sleep 30
#mediatomb -a /home/colin/Music &

echo "Time now $(date +\%T)"
