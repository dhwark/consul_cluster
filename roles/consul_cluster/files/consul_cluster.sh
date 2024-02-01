#!/bin/bash

wget https://releases.hashicorp.com/consul/1.17.2/consul_1.17.2_linux_amd64.zip

unzip consul_1.17.2_linux_amd64.zip
mkdir -p /usr/local/consul/{data,log}
mkdir /etc/consul
mv consul /usr/local/consul

chmod u+x /usr/local/consul

cat > /usr/lib/systemd/system/consul.service << "EOF"
[Unit]
Description=consul service
[Service]
ExecStart=/usr/local/consul/consul agent -server -config-dir=/etc/consul
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

