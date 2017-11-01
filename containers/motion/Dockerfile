FROM alpine

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
	apk update && \
	apk add motion

ADD startup.sh /

RUN chmod +x /startup.sh \
        && mkdir -p /data/Motion/movies \
        && mkdir -p /data/Motion/pictures \
        && mkdir /conf \
	&& touch /data/Motion/motion.pid

ADD motion.conf /conf/

EXPOSE 8080 8081

CMD /startup.sh 
