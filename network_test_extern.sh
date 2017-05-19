set +v
export MISSING_PING = /MISSING_PING.log
# <IP zum HOST>
export TEST=8.8.8.8

export /a count=1
echo >> $MISSING_PING$
echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| >> $MISSING_PING$
echo $DATE$ $TIME$ - MEGA PING WURDE GESTARTET >> $MISSING_PING$
echo |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| >> $MISSING_PING$
echo >> $MISSING_PING$

export /a count=$count$+1

ping $TEST$ -n 2

if $ERRORLEVEL$ == 0 ( 
# WORKS

echo level 0

)
if $ERRORLEVEL$ == 1 (
# ERROR
echo level 1
echo $count$ $time$ $date$ 

echo $DATE$ --- $TIME$ --- PING NUMMER: $count$ FAIL >> $MISSING_PING$
# PERFORMANCE KILLER @ ERROR
ping localhost -c 2
)

echo $count$ $TIME$ $DATE$

