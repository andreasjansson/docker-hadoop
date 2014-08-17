FROM    ubuntu:14.04

RUN     apt-get update

RUN     apt-get install -y wget

RUN     wget -O/tmp/hadoop-2.5.0.tar.gz http://mirror.cogentco.com/pub/apache/hadoop/common/hadoop-2.5.0/hadoop-2.5.0.tar.gz && \
            cd /tmp && tar xzvf hadoop-2.5.0.tar.gz && \
            mv /tmp/hadoop-2.5.0 /opt/hadoop && \
            rm /tmp/hadoop-2.5.0.tar.gz

RUN     apt-get install -y \
            openjdk-7-jdk \
            openssh-server \
            build-essential \
            supervisor \
            rsync \
            curl

RUN     apt-get install -y \
            python-pip

RUN     pip install envtpl

# setup sshd with root:root
RUN     mkdir /var/run/sshd
RUN     echo 'root:root' | chpasswd

ADD     conf/core.xml.tpl /etc/hadoop/core.xml.tpl
ADD     conf/hdfs.xml.tpl /etc/hadoop/hdfs.xml.tpl
ADD     conf/yarn.xml.tpl /etc/hadoop/yarn.xml.tpl
ADD     conf/mapred.xml.tpl /etc/hadoop/mapred.xml.tpl
ADD     conf/hadoop-env.sh.tpl /etc/hadoop/hadoop-env.sh.tpl
ADD     conf/yarn-env.sh.tpl /etc/hadoop/yarn-env.sh.tpl
ADD     supervisord.conf.tpl /etc/supervisor/supervisord.conf.tpl
