#!/bin/bash

sudo ifconfig enp3s0 up
sudo ip addr add 172.16.0.100/24 dev enp3s0
sudo ip route change 172.16.0.0 via 172.16.0.200

sudo systemctl start tftpd.socket
