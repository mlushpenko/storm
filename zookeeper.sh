#!/bin/bash

#install java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo 'debconf shared/accepted-oracle-license-v1-1 select true' | /usr/bin/debconf-set-selections
echo 'debconf shared/accepted-oracle-license-v1-1 seen true' | /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java6-installer
export JAVA_HOME=/usr/lib/jvm/java-6-oracle/jre

#install zookeeper
wget http://apache.claz.org/zookeeper/stable/zookeeper-3.4.6.tar.gz
tar -zxvf zookeeper-3.4.6.tar.gz
touch zookeeper-3.4.6/conf/zoo.cfg
echo 'tickTime=2000' >> zookeeper-3.4.6/conf/zoo.cfg
echo 'dataDir=/var/zookeeper' >> zookeeper-3.4.6/conf/zoo.cfg
echo 'clientPort=2181' >> zookeeper-3.4.6/conf/zoo.cfg

#install supervisor
wget https://bootstrap.pypa.io/ez_setup.py -O - | python
sudo easy_install supervisor
echo_supervisord_conf > supervisord.conf
#supervisorctl shutdown - to stop supervisor

#configure zookeeper under supervisor
echo '[program:zookeeper]' >> supervisord.conf
echo "command=sudo $(pwd)/zookeeper-3.4.6/bin/zkServer.sh start-foreground" >> supervisord.conf
echo 'autorestart=true' >> supervisord.conf
echo 'autostart=true' >> supervisord.conf

# start sepervisor
sudo supervisord -c supervisord.conf
