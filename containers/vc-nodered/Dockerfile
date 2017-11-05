FROM alpine

RUN apk update && \
	apk add nodejs nodejs-npm sudo

ADD startup.sh /

RUN mkdir /data &&\
	mkdir /conf &&\
	mkdir /bootstrap &&\
	mkdir -p /usr/src/node-red &&\
	chmod +x /startup.sh &&\
	adduser -h /usr/src/node-red -H -D -u 1000 vc &&\ 
	chown -R vc:vc /data &&\
	chown -R vc:vc /conf &&\
	chown -R vc:vc /bootstrap &&\
	chown -R vc:vc /usr/src/node-red &&\
	echo "vc ALL=(ALL) ALL" >> /etc/sudoers

WORKDIR /usr/src/node-red/

USER vc 

COPY package.json /usr/src/node-red/ 
ADD settings.js /bootstrap/

RUN npm install &&\
	npm install node-red-admin &&\
	npm install node-red-contrib-fs-ops

ENV FLOWS=flows.json

EXPOSE 1880

ENTRYPOINT ["/startup.sh"]

