FROM ubuntu:16.04

# Install shadowsocks-libev.
RUN apt-get update
RUN apt-get install -y wget software-properties-common
RUN add-apt-repository -y ppa:max-c-lv/shadowsocks-libev
RUN apt-get update
RUN apt install -y shadowsocks-libev

# Download GoQuiet server and client binaries.
RUN mkdir -p /opt/shadowsocks
RUN wget -O /opt/shadowsocks/gq-server https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-amd64-1.2.2
RUN chmod +x /opt/shadowsocks/gq-server
RUN wget -O /opt/shadowsocks/gq-client https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-client-linux-amd64-1.2.2
RUN chmod +x /opt/shadowsocks/gq-client

VOLUME /opt/shadowsocks
EXPOSE 443
EXPOSE 1080

ADD run-server.sh /opt/shadowsocks/run-server.sh
ADD run-client.sh /opt/shadowsocks/run-client.sh

CMD ["bash", "/opt/shadowsocks/run-server.sh"]

