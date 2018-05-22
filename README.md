# UC8100 Autorun
Example for autorun.sh

## Install
1. Copy files
  - `autorun.sh` to USB Stick
  - `usb-autorun-@.service` to `/etc/systemd/system/usb-autorun-@.service`
  - `99-usb-autorun.rules` to `/etc/udev/rules.d/99-usb-autorun.rules`
2. Execute `systemctl daemon-reload` and `udevadm control --reload-rules` for reloading configuration files (Optional, if you don't want to reboot the unit)

## Usage

1. Modify the `autorun.sh` to whatever you want.

2. Test it
  1. Insert USB which incluing `autorun.sh`, default: turn on led -> sleep 5 seconds -> turn off led
  ```bash
#!/bin/bash

set -x

echo "Turn ON LED"
echo 1 > /sys/class/leds/uc8100me\:USER/brightness

echo "Running something here..."
sleep 5

echo 0 > /sys/class/leds/uc8100me\:USER/brightness
echo "Turn OFF LED"
  ```
  2. `tail -F /var/log/syslog` check the results (syslog service enabled is needed, `systemctl restart rsyslog`)
  ```
May 23 10:53:43 localhost usb-autorun-AUTORUN: ===Start===
May 23 10:53:43 localhost usb-autorun-AUTORUN: + echo 1
May 23 10:53:43 localhost usb-autorun-AUTORUN: + sleep 5
May 23 10:53:48 localhost usb-autorun-AUTORUN: + echo 0
May 23 10:53:48 localhost usb-autorun-AUTORUN: ===End===
  ```
