#!/bin/bash

#configure master under supervisor
echo '[program:storm-nimbus]' >> supervisord.conf
echo "command=./apache-storm-0.9.3/bin/storm nimbus" >> supervisord.conf
echo 'autorestart=true' >> supervisord.conf
echo 'autostart=true' >> supervisord.conf
echo '[program:storm-ui]' >> supervisord.conf
echo "command=./apache-storm-0.9.3/bin/storm ui" >> supervisord.conf
echo 'autorestart=true' >> supervisord.conf
echo 'autostart=true' >> supervisord.conf
