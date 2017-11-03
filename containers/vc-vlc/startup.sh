#!/bin/sh

if [ ! -f /conf/.bootstrapped_vlc ]
then
	cp /bootstrap/vlc-nox.conf /conf/
	cp /bootstrap/sample.avi /data/
	echo 1 > /conf/.bootstrapped_vlc
fi

if [ -f /conf/vlc-nox-k8s.conf ]
then
	. /conf/vlc-nox-k8s.conf
else 
	. /conf/vlc-nox.conf
fi

while(true)
do
	su -c "vlc --rc-host 127.0.0.1:10000 --loop --sout \""$TRANSCODE"\" $URL" vlc
	sleep 5
done
