#!/bin/ash

if [ ! -f /conf/.bootstrapped_ftpd ]
then
	cp /bootstrap/proftpd.conf /conf/
	echo 1 > /conf/.bootstrapped_ftpd
fi

proftpd -n --config /conf/proftpd.conf
