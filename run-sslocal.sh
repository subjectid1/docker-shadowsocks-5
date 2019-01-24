#!/bin/bash
bash -c "ulimit -n 51200; exec sslocal -c /opt/shadowsocks/shadowsocks.json"
