#!/bin/sh

#[ -z "$DEVICE" ] && DEVICE="/dev/ttyUSB0"

#killall gpsd
#gpsd /dev/ttyACM0 -n -F /var/run/gpsd.sock
#gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock -G
#gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G

if [ ! -z "$DEVICE" ]; then
gpsd ${DEVICE} -n -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G
else
#gpsd -n -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G
gpsd start
fi
#service gpsd start

ntpd -n -p /var/run/ntpd.pid -g

exit 0
