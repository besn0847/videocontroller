FROM debian 

RUN apt-get update \
        && apt-get install -y --force-yes --no-install-recommends \
                locales vim wget \
	&& apt-get install apt-transport-https gnupg procps -y --force-yes

ADD startup.sh /

RUN chmod +x /startup.sh \
	&& mkdir /data \
	&& mkdir /conf \
	&& mkdir /data/Library \
	&& ln -s /data/Library /root/Library

RUN wget -O - http://shell.ninthgate.se/packages/shell.ninthgate.se.gpg.key | apt-key add - \
	&& echo "deb http://shell.ninthgate.se/packages/debian plexpass main" | tee /etc/apt/sources.list.d/pms.list \
	&& apt-get update \
	&& apt-get install -y --force-yes --no-install-recommends \
		plexmediaserver \
        && apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*

EXPOSE 32400

WORKDIR /

ENTRYPOINT ["/startup.sh"]
