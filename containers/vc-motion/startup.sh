#!/bin/bash

if [ ! -f /conf/.bootstrapped ]
then
	cp /bootstrap/motion.conf /conf/
	echo 1 > /conf/.bootstrapped
fi

while(true)
do
	motion -c /conf/motion.conf
	sleep 5
done
