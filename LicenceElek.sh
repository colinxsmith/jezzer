safeqp=${1:-safeqp}
safeqpw=`echo $safeqp`w
ELEK="/cygdrive/c/Program Files (x86)/Sciensoft/ElecKey 2.0 Express/Bin/"
PATH=$PATH:"$ELEK"
STP=`echo $safeqp.stp | sed "s/^lib//"`
echo $STP
#cp -p $safeqp.stp "$ELEK"
EKIntCon $STP "/original $safeqp.dll" "/target $safeqpw.dll"
mv $safeqpw.dll $safeqp.dll
