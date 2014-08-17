#!/bin/bash

envtpl /etc/hadoop/core.xml.tpl
envtpl /etc/hadoop/hdfs.xml.tpl
envtpl /etc/hadoop/yarn.xml.tpl
envtpl /etc/hadoop/mapred.xml.tpl
envtpl /etc/hadoop/hadoop-env.sh.tpl
envtpl /etc/hadoop/yarn-env.sh.tpl
envtpl /etc/supervisor/supervisord.conf.tpl

supervisord -n
