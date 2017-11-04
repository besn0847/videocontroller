#!/bin/ash

if [ ! -f /conf/.bootstrapped_nodered ]
then
	cp /bootstrap/settings.js /conf/
	echo 1 > /conf/.bootstrapped_nodered
fi

while(true)
do
	npm start -- --userDir /data --settings /conf/settings.js
done
