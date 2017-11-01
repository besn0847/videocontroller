FROM debian 

RUN apt-get update \
        && apt-get install -y --force-yes --no-install-recommends \
                vlc-nox \
        && apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*

ADD startup.sh /

RUN chmod +x /startup.sh \
	&& mkdir /data \
	&& mkdir /conf \
	&& useradd -b /home/vlc -d /home/vlc -s /bin/bash -m vlc \
	&& echo "vlc:passw0rd" | chpasswd

ADD sample.avi /data/
ADD vlc-nox.conf /conf/

EXPOSE 8888

WORKDIR /

ENTRYPOINT ["/startup.sh"]
