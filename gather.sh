PATH=/home/colin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH
HOME=/home/colin
export HOME
cd /home/colin/webby
#bash ./gatherbD.sh
#rm yahoostart_base*
startjob=$(date +%s)
logname=log$(date +%Y-%m-%d_%H_%M)
allok="yes"
bash generate.sh > $logname
if [ "$(sed -n "/Bad length/p" $logname)" ] ; then 
	allok="no"; 
fi

count=0
while [ "$allok" = "no" ] ;
do
	sleep 3600
	count=$((count+1))
	logname=log$(date +%Y-%m-%d_%H_%M)
	cp -p yahoostart.prev yahoostart
	bash generate.sh > $logname
	allok="yes"
	if [ "$(sed -n "/Bad length/p" $logname)" ] ; then 
		allok="no"; 
	fi
	if [ "$count" = 20 ]; then
		echo Break on count;
		break
	fi
	if [ "$(($(date +%s) - $startjob))" -gt "$((22*60*60))" ]; then 
		echo Break on time;
		break
	fi
done

if [ "$(sed -n "/YAHOO no good/p" $logname)" ] ; then 
	allok="no"; 
fi

if [ "$allok" = "yes" ] ; then
	if [ $(date +%A) = "Thursday" ] ; then 
		cp -p yahoostart yahoostart$(date +%d_%m_%Y);
	fi
	/home/colin/Dropbox/testjobs.sh
        ls -l ../problems | grep $(date +%b) >> $logname
fi
