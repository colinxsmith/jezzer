PATH=$PATH:/bin
DAYS=${1:--30}
if [ -f libsafeqp.so ];then
echo "Validate libsafeqp optimiser for $DAYS days"
echo "validas libsafeqp.so `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023"
echo "validas libsafeqp.so `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023" | /bin/sh
fi;
if [ -f safeqp.dll ];then
echo "Validate safeqp optimiser for $DAYS days"
echo "validas safeqp.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023"
echo "validas safeqp.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023" | /bin/sh
fi;
if [ -f embedded.dll ];then
echo "Validate embedded optimiser for $DAYS days"
echo "validas embedded.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023"
echo "validas embedded.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023" | /bin/sh
fi;
if [ -f tl_embedded.dll ];then
echo "Validate tl_embedded optimiser for $DAYS days"
echo "validas tl_embedded.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023";
echo "validas tl_embedded.dll `future -b 13101D54 \`date +%d/%m/20%y\` +$DAYS` 1023" | /bin/sh;
fi;
