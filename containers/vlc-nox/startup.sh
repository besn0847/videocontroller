#!/bin/sh

. /conf/vlc-nox.conf

su -c "vlc --rc-host 127.0.0.1:10000 --loop --sout \""$TRANSCODE"\" $URL" vlc
