#!/bin/bash
bash -c "ulimit -n 51200; exec ss-local -c /opt/shadowsocks/shadowsocks.json"
