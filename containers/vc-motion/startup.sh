#!/bin/bash

if [ ! -f /conf/.bootstrapped_motion ]
then
	cp /bootstrap/motion.conf /conf/
	mkdir -p /data/Motion/movies
	mkdir -p /data/Motion/pictures
	touch /data/Motion/motion.pid
	echo 1 > /conf/.bootstrapped_motion
fi

while(true)
do
	sudo -u vc motion -c /conf/motion.conf
	sleep 5
done
