FROM alpine

RUN apk update && \
	apk add nodejs nodejs-npm 

ADD startup.sh /

RUN mkdir /data &&\
	mkdir /conf &&\
	mkdir /bootstrap &&\
	mkdir -p /usr/src/node-red &&\
	chmod +x /startup.sh &&\
	adduser -h /usr/src/node-red -H -D node-red &&\ 
	chown -R node-red:node-red /data &&\
	chown -R node-red:node-red /conf &&\
	chown -R node-red:node-red /bootstrap &&\
	chown -R node-red:node-red /usr/src/node-red

WORKDIR /usr/src/node-red/

USER node-red

COPY package.json /usr/src/node-red/ 
ADD settings.js /bootstrap/

RUN npm install &&\
	npm install node-red-admin

ENV FLOWS=flows.json

EXPOSE 1880

ENTRYPOINT ["/startup.sh"]

