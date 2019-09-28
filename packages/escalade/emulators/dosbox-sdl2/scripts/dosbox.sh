#!/bin/sh

. /etc/profile

emu_start

LANG=en_US.utf8 dosbox "$@" > /var/log/dosbox.log 2>&1

emu_stop
