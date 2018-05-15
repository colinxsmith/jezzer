#for i in C*.jpg
#do
# echo $i
# date=`stat "$i" | awk '/Mod/{print $2,$3}'|sed "s/-/:/g;s/ /-/;s/\..*//"`
# echo $date
# jhead -ts$date "$i"
#done

#OR

#Add the same time to each picture taken time
exiftool -AllDates+="8:2:25 0" C*.jpg
