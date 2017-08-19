#!/bin/bash
bash -c "ulimit -n 51200; exec ssserver -c /opt/shadowsocks/shadowsocks.json"
