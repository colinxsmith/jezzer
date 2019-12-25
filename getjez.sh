#!/bin/bash
cd ~/Music
mkdir Jezzer
cd Jezzer
maxdays=30
rm index.html*
progname="Somethin&#039; Else"
wget http://www.jazzfm.com/player/default/#
sed -n "/$progname/,/div class/p" index.html | awk -F/ /od/'{print "wget http://www.jazzfm.com/player/od/items/"$5"/"}' | bash
#filenames=`sed -n "/$progname/,/div class/p" index.html | awk -F/ /od/'{print $4}'` 
filenames=`sed -n "/mp3/p" index.html.1 |sed "s/\\\\\\\\//g"| sed "s/^.*http/http/;s/\".*//"`
echo $filenames
for filename in $filenames
do
echo $filename
#url=`sed -n "/\.mp3'/p" $filename | awk -F\' '{print $2}'`
url="$filename"
echo $url
music=$url #`echo $url | filenames=`sed -n "/mp3/p" index.html.1 |sed "s/\\\\\\\\//g"| sed "s/^.*http/http/;s/\".*//"``
target=$(echo $url | awk -F_ '{print "Jez_"$2"-"$3"-20"$4}')
echo $music
echo $target
echo ${music%.mp3}.mp3
if ! [ -f ${target%.mp3}.mp3 ]
then
echo get $url
#gfile=$(sed -n "/\.mp3'/p" $filename | awk -F\' '{print $2}')
wget $url
music=`echo $filename|sed "s/^.*pod/pod/"`
echo $music
#ffmpeg -i $music -codec: copy ${target%.mp3}.aac
cp -p $music  ${target%.mp3}.mp3
rm end.mp3
ffmpeg -ss 7260 -i ${target%.mp3}.mp3 end.mp3
fi
rm $music
done
rm index.html*
ls -l ${target%.mp3}.mp3
#echo ${target%.mp3}.mp3|sed "s/.*_//;s/\..*//"|awk -F- '{ print "date --date="$3"/"$2"/"$1" +%s" }'|bash
ls -l --time-style=+%s $target.mp3 | awk '{ print $6 }'
for jez in Jez*
do
#filetime=$(echo $jez|sed "s/.*_//;s/\..*//"|awk -F- '{ print "date --date="$3"/"$2"/"$1" +%s" }'|bash)e
filetime=$(ls -l --time-style=+%s $jez | awk '{ print $6 }')
now=$(date +%s)
fileage=$(echo $now-$filetime | awk -F- '{ a=($1-$2)/3600/24;b=(a-int(a))*24;c=(b-int(b))*60;d=(c-int(c))*60;printf("\x1b[1;1;31m%d days %d hours %d minutes %d seconds\x1b[0;m", int(a),b,c,d);}')
check=$(echo $now-$filetime | awk -F- '{ a=($1-$2)/3600/24;print int(a);}')
echo Age of $jez is $fileage
if  [ $check -gt $maxdays ]
then
echo More than $maxdays days
echo Delete $jez
rm $jez
fi
done
