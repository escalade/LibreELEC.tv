#!/bin/sh

rm -f /storage/.cache/bluetooth/*/settings
sed -i -e "s/^Name\ =.*/Name\ =\ `hostname`/" /storage/.config/bluetooth/main.conf
hciconfig hci0 up
