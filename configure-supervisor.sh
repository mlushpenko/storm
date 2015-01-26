#!/bin/bash

#configure slave under supervisor
echo '[program:storm-supervisor]' >> supervisord.conf
echo "command=sudo ./apache-storm-0.9.3/bin/storm supervisor" >> supervisord.conf
echo 'autorestart=true' >> supervisord.conf
echo 'autostart=true' >> supervisord.conf
