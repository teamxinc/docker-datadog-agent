FROM datadog/agent:6.1.4

RUN apt-get update
RUN apt-get install -y git

COPY ./start.sh /start.sh
RUN chmod 755 /start.sh
WORKDIR /conf.d

CMD ["/start.sh"]