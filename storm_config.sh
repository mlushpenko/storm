#!/bin/bash

#configure node
echo 'storm.zookeeper.servers:' >> apache-storm-0.9.3/conf/storm.yaml
echo "    - \"$ZOOKEEPER_IP\"" >> apache-storm-0.9.3/conf/storm.yaml
echo "nimbus.host: \"$NIMBUS_IP\"" >> apache-storm-0.9.3/conf/storm.yaml
echo 'storm.local.dir: "/mnt/storm"' >> apache-storm-0.9.3/conf/storm.yaml
echo "storm.local.hostname: \"$LOCAL_IP\"" >> apache-storm-0.9.3/conf/storm.yaml
export STORM_LOCAL_DIR=/mnt/storm
mkdir $STORM_LOCAL_DIR
chmod -R 755 $STORM_LOCAL_DIR

sudo supervisord -c supervisord.conf
