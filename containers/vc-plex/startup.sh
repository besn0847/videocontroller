#!/bin/sh

if [ ! -f /conf/.bootstrapped_plex ]
then
	mkdir /data/Library
	ln -s /data/Library /root/Library

	echo 1 > /conf/.bootstrapped_plex
fi

PLEX_MEDIA_SERVER_USER=root /usr/sbin/start_pms
