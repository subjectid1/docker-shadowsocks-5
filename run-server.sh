#!/bin/bash
bash -c "ulimit -n 51200; exec ss-server -c /opt/shadowsocks/shadowsocks.json"
