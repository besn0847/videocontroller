FROM alpine

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
	apk update && \
	apk add openssh

ADD startup.sh /

RUN mkdir /data &&\
	mkdir /conf &&\
	mkdir /bootstrap &&\
	chmod +x /startup.sh &&\
	adduser -h / -H -D -s /bin/ash default &&\
	echo "default:passw0rd" | chpasswd &&\
	chown -R default.default /data &&\
	chown -R default.default /conf 

ADD sshd.conf /bootstrap/

RUN /usr/bin/ssh-keygen -A &&\
	ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22

ENTRYPOINT ["/startup.sh"]
