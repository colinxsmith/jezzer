#!/bin/bash
#sudo apt install libxml2-dev
#cpan -i CPAN
#cpan -i XML::Simple
#cpan -i XML::LibXML::XPathContext
cd /home/colin/iplayer
#git clone https://github.com/get-iplayer/get_iplayer.git
#cd /home/colin/iplayer/get_iplayer-2.93/
cd /home/colin/iplayer/get_iplayer/
echo Yes | ./get_iplayer --purge-files --type=radio
echo Yes | ./get_iplayer --purge-files --type=tv
./get_iplayer --refresh --type=radio
./get_iplayer --refresh --type=tv
#./get_iplayer --pid=b097sn02 -o /home/colin/Videos

#./get_iplayer --pvr-add Plant "The Secrets of Quantum Physics"
#./get_iplayer --pvr-add Plant "Robert Plant"
#./get_iplayer --pvr-add Page "Jimmy Page"
#./get_iplayer --pvr-add Peel "John Peel"
#./get_iplayer --pvr-add Gilles Gilles
#./get_iplayer --pvr-add Iggy Iggy
#./get_iplayer --pvr-add Jazz "Jazz on 3"
./get_iplayer --pvr-list

echo "Time now $(date +\%T)"

./get_iplayer --pvr --type=radio -o /home/colin/Music
./get_iplayer --pvr --type=tv -o /home/colin/Videos

cd /home/colin/Music

for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -codec: copy kkk.aac;ffmpeg -i kkk.aac -ab ${rate}k "${f%.m4a}.mp3";rm kkk.aac;tt=$(ls -l --time-style +%s "${f%.m4a}.mp3"|awk '{print $6}');echo $tt;art=$(echo "${f%.m4a}.mp3" |awk -F "-" '{print $1}'|sed "s/_/ /g");tit=$(echo "${f%.m4a}.mp3" |awk -F "-" '{print $2}'|sed "s/_/ /g;s/\.mp3//g");id3v2 -A "BBC Recording" -a "$art" -t "$tit" "${f%.m4a}.mp3";id3v2 -l "${f%.m4a}.mp3";touch -m --date="@$tt" "${f%.m4a}.mp3";fi; done

for i in *.mp3;do if ! [ -f ${i%.mp3}.m4a ]; then echo $i; rm $i;fi; done

sleep 10

echo "Time now $(date +\%T)"
