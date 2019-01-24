FROM python:3.6

# Install latest shadowsocks which supports 'aes-256-gcm' method.
RUN pip install --no-cache-dir https://github.com/shadowsocks/shadowsocks/archive/master.zip

# Download GoQuiet server.
RUN mkdir -p /opt/shadowsocks
RUN wget -O /opt/shadowsocks/gq-server https://github.com/cbeuw/GoQuiet/releases/download/v1.2.2/gq-server-linux-amd64-1.2.2
RUN chmod +x /opt/shadowsocks/gq-server

VOLUME /opt/shadowsocks
EXPOSE 443

ADD run-ssserver.sh /opt/shadowsocks/run-ssserver.sh

CMD ["bash", "/opt/shadowsocks/run-ssserver.sh"]

