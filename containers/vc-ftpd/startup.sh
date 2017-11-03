#!/bin/ash

if [ ! -f /conf/.bootstrapped ]
then
	cp /bootstrap/proftpd.conf /conf/
	echo 1 > /conf/.bootstrapped
fi

proftpd -n --config /conf/proftpd.conf
