#!/bin/bash

# This script spikes CPU usage for 10 minutes

consumecpu() {
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null |
  dd if=/dev/zero of=/dev/null &
};

consumecpu

for i in {1..10}
do
  sleep 60
  echo "Warning: AWS monitoring taking more resources than expected!"
done

killall dd