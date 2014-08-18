#!/bin/bash

set -e

# if $ROLE == 'NODEMANAGER': hostname = internal_ip (or $HOSTNAME)

N_CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
export MAP_TASKS_MAXIMUM=${MAP_TASKS_MAXIMUM:-$N_CORES}
export REDUCE_TASKS_MAXIMUM=${REDUCE_TASKS_MAXIMUM:-$N_CORES}

envtpl /etc/hadoop/core-site.xml.tpl
envtpl /etc/hadoop/hdfs-site.xml.tpl
envtpl /etc/hadoop/yarn-site.xml.tpl
envtpl /etc/hadoop/mapred-site.xml.tpl
envtpl /etc/hadoop/hadoop-env.sh.tpl
envtpl /etc/hadoop/yarn-env.sh.tpl
envtpl /etc/supervisor/supervisord.conf.tpl

make_slaves.py > /etc/hadoop/slaves

supervisord -n -c /etc/supervisor/supervisord.conf
