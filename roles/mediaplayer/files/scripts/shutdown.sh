#!/bin/bash
REBOOT_GREP=$(systemctl list-units --type=target | grep reboot)
SHUTDOWN_GREP=$(systemctl list-units --type=target | grep shutdown)
if [ "$SHUTDOWN_GREP" ] && [ ! "$REBOOT_GREP" ]; then
  # the condition above makes sure, that the shutdown sequence is not run on reboot 
  GPIOpin=15
  GPIOpin1=14
  echo "$GPIOpin" > /sys/class/gpio/export
  echo "out" > /sys/class/gpio/gpio$GPIOpin/direction
  echo "1" > /sys/class/gpio/gpio$GPIOpin/value
  sleep 0.125
  echo "0" > /sys/class/gpio/gpio$GPIOpin/value
  sleep 0.2
  echo "1" > /sys/class/gpio/gpio$GPIOpin/value
  sleep 0.4
  echo "0" > /sys/class/gpio/gpio$GPIOpin/value
  echo "$GPIOpin1" > /sys/class/gpio/export
  echo "out" > /sys/class/gpio/gpio$GPIOpin1/direction
  echo "1" > /sys/class/gpio/gpio$GPIOpin1/value
  sleep 4
fi
