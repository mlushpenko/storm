#!/bin/bash

#install java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo 'debconf shared/accepted-oracle-license-v1-1 select true' | /usr/bin/debconf-set-selections
echo 'debconf shared/accepted-oracle-license-v1-1 seen true' | /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java6-installer
export JAVA_HOME=/usr/lib/jvm/java-6-oracle/jre

#install python2.6
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get install -y python2.6 python2.6-dev

# download and unzip Storm
wget http://apache.claz.org/storm/apache-storm-0.9.3/apache-storm-0.9.3.tar.gz
tar -zxvf apache-storm-0.9.3.tar.gz

#install supervisor
wget https://bootstrap.pypa.io/ez_setup.py -O - | python
sudo easy_install supervisor
echo_supervisord_conf > supervisord.conf
