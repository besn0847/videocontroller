FROM debian

RUN apt-get update \
        && apt-get install -y --force-yes --no-install-recommends \
                motion \
        && apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*


ADD startup.sh /

RUN chmod +x /startup.sh \
        && mkdir -p /data/Motion/movies \
        && mkdir -p /data/Motion/pictures \
        && mkdir /conf \
	&& touch /data/Motion/motion.pid

ADD motion.conf /conf/

EXPOSE 8081

CMD /startup.sh 
