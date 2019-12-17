#!/bin/bash
#cpan -i CPAN
#cpan -i XML::Simple
#cpan -i XML::LibXML::XPathContext
cd /home/colin/iplayer

#git clone https://github.com/get-iplayer/get_iplayer.git

#cd /home/colin/iplayer/get_iplayer-2.93
cd /home/colin/iplayer/get_iplayer
#use --pid-recursive with --pid to other programs in a series
#./get_iplayer --update
#./get_iplayer --type=radio --refresh-future --refresh
./get_iplayer --type=radio --refresh
./get_iplayer --type=tv --refresh 
#./get_iplayer --type=radio
./get_iplayer --get --type=radio -o /home/colin/Music "Jazz on 3"
./get_iplayer --get --type=radio -o /home/colin/Music "Jazz Now"
./get_iplayer --get --type=radio -o /home/colin/Music "Iggy"
./get_iplayer --get --type=radio -o /home/colin/Music "Gilles"
./get_iplayer --get --type=radio -o /home/colin/Music Rodigan
./get_iplayer --get --type=radio -o /home/colin/Music 6.*Music.*lassic
./get_iplayer --type=tv --get -o ~/Videos "Without Limits"
#./get_iplayer --get --type=radio -o /home/colin/Music "years of rock"
cd /home/colin/Music
#for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.m4a}.mp3";fi; done
for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.m4a}.mp3";tt=$(ls -l --time-style +%s "${f%.m4a}.mp3"|awk '{print $6}');echo $tt;art=$(echo "${f%.m4a}.mp3" |awk -F "-" '{print $1}'|sed "s/_/ /g");tit=$(echo "${f%.m4a}.mp3" |awk -F "-" '{print $2}'|sed "s/_/ /g;s/\.mp3//g");id3v2 -A "BBC Recording" -a "$art" -t "$tit" "${f%.m4a}.mp3";id3v2 -l "${f%.m4a}.mp3";touch -m --date="@$tt" "${f%.m4a}.mp3";fi; done
#for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.m4a}.mp3";fi; done
#for f in *.aac;do if ! [ -f ${f%.aac}.mp3 ]; then ffmpeg -i "$f" -ab 128k "${f%.aac}.mp3";fi; done
#ps -e | grep media
#kill -9 `ps -e| awk '/mediatomb/{ print $1 }'`
sleep 30
#mediatomb -a /home/colin/Music& 
ps -e | grep media
date
