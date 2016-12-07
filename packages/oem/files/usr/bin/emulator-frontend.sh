#!/bin/sh

. /storage/.config/emulator-frontend.conf

systemd-run $FRONTEND
