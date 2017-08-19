FROM python:3.6.2

RUN pip install --no-cache-dir shadowsocks

VOLUME /opt/shadowsocks
EXPOSE 8388

ADD run-ssserver.sh /opt/shadowsocks/run-ssserver.sh

CMD ["bash", "/opt/shadowsocks/run-ssserver.sh"]

