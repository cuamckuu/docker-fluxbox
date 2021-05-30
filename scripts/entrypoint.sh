#!/usr/bin/env sh

printf "asdaww\nasdaww\ny\n" | script -q -c "x11vnc -storepasswd"

x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -shared -create -env FD_PROG=/usr/bin/startfluxbox
