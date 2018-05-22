#!/bin/bash

set -x

echo "Turn ON LED"
echo 1 > /sys/class/leds/uc8100me\:USER/brightness

echo "Running something here..."
sleep 5

echo 0 > /sys/class/leds/uc8100me\:USER/brightness
echo "Turn OFF LED"

