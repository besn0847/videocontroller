#!/bin/ash

if [ ! -f /conf/.bootstrapped_sshd ]
then
	cp /bootstrap/sshd.conf /conf/
	echo 1 > /conf/.bootstrapped_sshd
fi

/usr/sbin/sshd -D -f /conf/sshd.conf
