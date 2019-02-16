FROM python:3.6

# Install libsodium.
RUN apt update && apt install libsodium18

# Install latest shadowsocks.
RUN pip install --no-cache-dir https://github.com/shadowsocks/shadowsocks/archive/master.zip

# Download GoQuiet server and client binaries.
RUN mkdir -p /opt/shadowsocks
RUN wget -O /opt/shadowsocks/gq-server https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-amd64-1.2.2
RUN chmod +x /opt/shadowsocks/gq-server
RUN wget -O /opt/shadowsocks/gq-client https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-client-linux-amd64-1.2.2
RUN chmod +x /opt/shadowsocks/gq-client

VOLUME /opt/shadowsocks
EXPOSE 443
EXPOSE 1080

ADD run-ssserver.sh /opt/shadowsocks/run-ssserver.sh
ADD run-sslocal.sh /opt/shadowsocks/run-sslocal.sh

CMD ["bash", "/opt/shadowsocks/run-ssserver.sh"]

