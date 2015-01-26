# storm
Scripts for setting up a storm cluster

# Installation

Setup Zookeepr, Nimbus (master) and Supervisor (slave) on separate VMs. Zookeeper is set up in standalone mode (it is possible to set up Zookeeper cluster if you need fault tolerance).

1. Start a vm for zookeeper. Run zookeeper.sh. Done.
2. Start a vm for nimbus. Create two environment variables: "export ZOOKEEPER_IP=0.0.0.0" (IP of zookeper VM from pervious step) and "export NIMBUS_IP=0.0.0.0" (IP of current VM). Run install-nimbus_or_supervisor.sh, then configure-nimbus.sh, then storm_config.sh. Done.
3. Start a vm for supervisor (you can launch many supervisors). Create two environment variables: "export ZOOKEEPER_IP=0.0.0.0" (IP of zookeper VM from pervious step) and "export NIMBUS_IP=0.0.0.0" (IP of current VM). Run install-nimbus_or_supervisor.sh, then configure-supervisor.sh, then storm_config.sh. Done. 
