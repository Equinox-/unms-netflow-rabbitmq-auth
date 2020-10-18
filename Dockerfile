FROM ubnt/unms-netflow:1.2.7
MAINTAINER Westin Miller "equinoxscripts@gmail.com"

ENV UNMS_RABBITMQ_USER="" \
	UNMS_RABBITMQ_PASS=""

COPY config.js.patch \
	 rabbitmq-index.js.patch /tmp/


# Use sed at the end because there's something weird with busybox patch
RUN patch /home/app/config.js /tmp/config.js.patch \
	&& patch /home/app/lib/rabbitmq/index.js /tmp/rabbitmq-index.js.patch \
	&& sed -i 's/amqp:\/\/${host}:${port}/amqp:\/\/${user}:${pass}@${host}:${port}/' /home/app/lib/rabbitmq/index.js

ENTRYPOINT ["yarn", "start"]
