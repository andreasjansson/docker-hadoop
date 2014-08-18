FROM    ubuntu:14.04

RUN     apt-get update

RUN     apt-get install -y wget

RUN     wget -O/tmp/hadoop-2.5.0.tar.gz http://mirror.cogentco.com/pub/apache/hadoop/common/hadoop-2.5.0/hadoop-2.5.0.tar.gz && \
            cd /tmp && tar xzvf hadoop-2.5.0.tar.gz && \
            mv /tmp/hadoop-2.5.0 /opt/hadoop && \
            rm /tmp/hadoop-2.5.0.tar.gz && \
            rm -r /opt/hadoop/share/doc

RUN     apt-get install -y \
            openjdk-7-jdk \
            openssh-server \
            build-essential \
            supervisor \
            rsync \
            curl \
            python-pip \
            python-scipy \
            python-numpy

RUN     pip install \
            envtpl \
            scikit-learn

# setup sshd with root:root
RUN     mkdir /var/run/sshd
RUN     echo 'root:root' | chpasswd

ADD     conf/ /etc/hadoop/
ADD     supervisord.conf.tpl /etc/supervisor/supervisord.conf.tpl
ADD     start_container.sh /usr/bin/start_container.sh
RUN     chmod +x /usr/bin/start_container.sh
ADD     make_slaves.py /usr/bin/make_slaves.py
RUN     chmod +x /usr/bin/make_slaves.py
ADD     environment /etc/environment

ENV     PATH $PATH:/opt/hadoop/bin:/opt/hadoop/sbin
ENV     JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN     mkdir /var/log/hadoop

CMD     start_container.sh

