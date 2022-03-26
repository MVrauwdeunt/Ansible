#!/bin/bash
# this is the GPIO pin receiving the shut-down signal
GPIOpin1=14
echo "$GPIOpin1" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio$GPIOpin1/direction
while true; do
  sleep 1
  power=$(cat /sys/class/gpio/gpio$GPIOpin1/value)
  if [ $power != 0 ]; then
    sudo systemctl stop mediacenter
    echo "out" > /sys/class/gpio/gpio$GPIOpin1/direction
    echo "1" > /sys/class/gpio/gpio$GPIOpin1/value
    sleep 3
    sudo shutdown -h now
  fi
done
