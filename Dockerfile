FROM alpine:3.9

WORKDIR /
ENV NPS_VERSION 0.26.8

RUN set -x && \
	wget --no-check-certificate https://github.com/ehang-io/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
	tar xzf linux_amd64_server.tar.gz && \
	cd /nps && \
	rm -rf /linux_amd64_server.tar.gz


ADD start.sh /nps/start.sh
RUN chmod +x /nps/start.sh
ADD nps.conf /nps/conf/
VOLUME /nps/conf
CMD /nps/start.sh
