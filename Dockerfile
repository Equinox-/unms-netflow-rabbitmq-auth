FROM ubnt/unms-netflow:0.13.3
MAINTAINER Westin Miller "equinoxscripts@gmail.com"

ENV UNMS_RABBITMQ_USER="" \
	UNMS_RABBITMQ_PASS=""

COPY config.js.patch \
	 rabbitmq-index.js.patch /tmp/

RUN patch /home/app/config.js /tmp/config.js.patch \
	&& patch /home/app/lib/rabbitmq/index.js /tmp/rabbitmq-index.js.patch

ENTRYPOINT ["yarn", "start"]
