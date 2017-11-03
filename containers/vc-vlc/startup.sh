#!/bin/sh

if [ ! -f /conf/.bootstrapped ]
then
	cp /bootstrap/vlc-nox.conf /conf/
	cp /bootstrap/sample.avi /data/
	echo 1 > /conf/.bootstrapped
fi

. /conf/vlc-nox.conf

while(true)
do
	su -c "vlc --rc-host 127.0.0.1:10000 --loop --sout \""$TRANSCODE"\" $URL" vlc
	sleep 5
done
