#!/bin/bash

# if spotify is started
if [ "$(pidof spotify)" ]; then
    # status can be: Playing, Paused or Stopped
    status=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1|egrep -v ^$`
    if [ "$status" = "Playing" ]; then
        echo "";
    else
        echo "";
    fi
else
	echo "Not running"
fi
