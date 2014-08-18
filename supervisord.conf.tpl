[supervisord]
logfile = /var/log/supervisord.log

[unix_http_server]
file=/tmp/supervisor.sock

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:sshd]
command = /usr/sbin/sshd -o PermitRootLogin=yes -D
autorestart = true

{% if ROLE == 'NAMENODE' %}

[program:namenode]
command = hdfs --config /etc/hadoop namenode
stdout_logfile = /var/log/hadoop/namenode.stdout
stderr_logfile = /var/log/hadoop/namenode.stderr
autostart = false

{% elif ROLE == 'RESOURCEMANAGER' %}

[program:resourcemanager]
command = yarn --config /etc/hadoop resourcemanager
stdout_logfile = /var/log/hadoop/resourcemanager.stdout
stderr_logfile = /var/log/hadoop/resourcemanager.stderr
autostart = false

{% elif ROLE == 'SLAVE' %}

[program:datanode]
command = hdfs --config /etc/hadoop datanode
stdout_logfile = /var/log/hadoop/datanode.stdout
stderr_logfile = /var/log/hadoop/datanode.stderr
autostart = false

[program:nodemanager]
command = yarn --config /etc/hadoop nodemanager
stdout_logfile = /var/log/hadoop/nodemanager.stdout
stderr_logfile = /var/log/hadoop/nodemanager.stderr
autostart = false

{% endif %}
