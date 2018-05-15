#!/bin/sh

computer=${1:-foxcub.local}

cd ~

for i in getlive.sh getprograms.sh getprog.sh transfermp3.sh
do
  if $(ssh colin@$computer exit)
  then
    echo "Getting the file $i"
    ssh colin@$computer "cat ~/Dropbox/$i" | sed "s|/colin|/pi|g" > $i
    chmod 777 ~/$i
  else
    echo "$computer is not available"
    break
  fi
done

ls -l *.sh
