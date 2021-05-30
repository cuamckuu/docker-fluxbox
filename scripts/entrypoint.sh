#!/usr/bin/env sh

x11vnc -forever -loop -noxdamage -repeat -passwd asdaww -shared -create -env FD_PROG=/usr/bin/startfluxbox
