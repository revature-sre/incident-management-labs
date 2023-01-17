#!/bin/bash

# This script introduces latency to all requests for 30 minutes

# This command identifies the network interfaces we want
# ip -br l | awk '$1 !~ "lo|vir|wl|eni" { print $1}'

LATENCY=500ms
ip -br l | awk '$1 !~ "lo|vir|wl|eni" { print $1}' | xargs -l -I % sudo tc qdisc add dev % root netem delay $LATENCY

for i in {1..10}
do
  sleep 120
  echo `date +"%Y-%m-%d %T"`" - Warning: AWS monitoring detected a failing ethernet cable."
done

ip -br l | awk '$1 !~ "lo|vir|wl|eni" { print $1}' | xargs -l -I % sudo tc qdisc del dev % root netem delay $LATENCY