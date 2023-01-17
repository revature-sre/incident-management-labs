#!/bin/bash

# This script spikes CPU usage for 10 minutes

consumecpu() {
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null &
};

consumecpu

for i in {1..5}
do
  sleep 120
  echo `date +"%Y-%M-%d %T"`" - Warning: AWS monitoring taking more resources than expected!"
done

killall dd