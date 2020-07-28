FROM alpine:3.8

WORKDIR /
ENV NPS_VERSION 0.26.8

RUN mkdir /nps
RUN wget --no-check-certificate https://github.com/ehang-io/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz
RUN tar xzf linux_amd64_server.tar.gz -C /nps
RUN rm -rf linux_amd64_server.tar.gz

WORKDIR /nps
ADD start.sh /nps/start.sh
RUN chmod +x /nps/start.sh
ADD nps.conf /nps/conf/
VOLUME /nps/conf
CMD /nps/start.sh
