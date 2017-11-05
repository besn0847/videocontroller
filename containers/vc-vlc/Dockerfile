FROM debian 

RUN apt-get update \
        && apt-get install -y --force-yes --no-install-recommends \
                vlc-nox sudo procps \
        && apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*

ADD startup.sh /

RUN chmod +x /startup.sh \
	&& mkdir /data \
	&& mkdir /conf \
	&& mkdir /bootstrap \
	&& useradd -b /home/vc -d /home/vc -u 1000 -s /bin/bash -m vc &&\
 	echo "vc:passw0rd" | chpasswd &&\
        chown -R vc.vc /data &&\
        chown -R vc.vc /conf &&\
        chown -R vc.vc /bootstrap &&\
        echo "vc ALL=(ALL) ALL" >> /etc/sudoers

USER vc

ADD sample.avi /bootstrap/
ADD vlc-nox.conf /bootstrap/

EXPOSE 8888

WORKDIR /

ENTRYPOINT ["/startup.sh"]
