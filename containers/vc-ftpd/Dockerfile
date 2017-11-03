FROM alpine

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
	apk update && \
	apk add proftpd

ADD startup.sh /

RUN mkdir /data &&\
	mkdir /conf &&\
	mkdir /bootstrap &&\
	chmod +x /startup.sh &&\
	adduser -h / -H -D -s /bin/ash default &&\
	echo "default:passw0rd" | chpasswd &&\
	chown -R default.default /data &&\
	chown -R default.default /conf &&\
	mkdir -p /run/proftpd/ &&\
	touch /run/proftpd/proftpd.pid

ADD proftpd.conf /bootstrap/ 

EXPOSE 30020 30021

ENTRYPOINT ["/startup.sh"]
