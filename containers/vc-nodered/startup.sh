#!/bin/ash

if [ ! -f /conf/.bootstrapped_nodered ]
then
	cp /bootstrap/settings.js /conf/
	cp /bootstrap/flows.json /conf/
	echo 1 > /conf/.bootstrapped_nodered
fi

while(true)
do
	sudo -u vc npm start -- --userDir /data --settings /conf/settings.js /conf/flows.json
done
