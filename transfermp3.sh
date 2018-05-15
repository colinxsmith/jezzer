#!/bin/sh

f="$1"

if [ -f "${f%.aac}.aac" ]
then

if ! [ -f "../mp3/${f%.aac}.mp3" ]
then
avconv -i "$f" -codec: copy "${f%.aac}.m4a"
f="${f%.aac}.m4a"
rate=`mediainfo "$f"| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`
avconv -i "$f" -ab ${rate}k "${f%.m4a}.mp3"
rm "$f"
mv "${f%.m4a}.mp3" ../mp3
fi

elif [ -f "${f%.m4a}.m4a" ]
then
if ! [ -f "../mp3/${f%.m4a}.mp3" ]
then
rate=`mediainfo "$f"| awk '/Bit rate/{print $4}'|sed -n "/[0-9]/p"`
avconv -i "$f" -ab ${rate}k "${f%.m4a}.mp3"
mv "${f%.m4a}.mp3" ../mp3
fi

fi
