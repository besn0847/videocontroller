FROM alpine

RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
	apk update && \
	apk add openssh sudo

ADD startup.sh /

RUN mkdir /data &&\
	mkdir /conf &&\
	mkdir /bootstrap &&\
	chmod +x /startup.sh &&\
	adduser -h / -H -D -u 1000 -s /bin/ash vc &&\
	echo "vc:passw0rd" | chpasswd &&\
	chown -R vc.vc /data &&\
	chown -R vc.vc /conf &&\
	echo "vc ALL=(ALL) ALL" >> /etc/sudoers 

ADD sshd.conf /bootstrap/

RUN /usr/bin/ssh-keygen -A &&\
	ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22

ENTRYPOINT ["/startup.sh"]
