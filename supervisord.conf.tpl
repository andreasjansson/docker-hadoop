[supervisord]
logfile = /var/log/supervisord.log

[unix_http_server]
file=/tmp/supervisor.sock

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:sshd]
command = /usr/sbin/sshd -D
autorestart = true

{% if ROLE == 'NAMENODE' %}

[program:namenode]
command = /opt/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop --script hdfs start namenode

{% elif ROLE == 'RESOURCEMANAGER' %}

[program:resourcemanager]
command = /opt/hadoop/sbin/yarn-daemon.sh --config /etc/hadoop start resourcemanager

{% elif ROLE == 'SLAVE' %}

[program:datanode]
command = /opt/hadoop/sbin/hadoop-daemon.sh --config /etc/hadoop --script hdfs start datanode

[program:nodemanager]
command = /opt/hadoop/sbin/yarn-daemon.sh --config /etc/hadoop start nodemanager

{% end %}
