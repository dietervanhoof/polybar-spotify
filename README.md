# polybar-spotify (forked from [polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify))
This module provides some basic interactivity on top of [the original polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify).

[![paused](https://i.imgur.com/Wx4vHPr.png)](https://i.imgur.com/Wx4vHPr.png)

[![playing](https://i.imgur.com/wb8ASGo.png)](https://i.imgur.com/wb8ASGo.png)

Specifically it adds:
- Play/Pause button
- Next song
- Previous song

## Dependencies
- Python (2.x or 3.x)
- Python `dbus` module

## Settings
Add the parts you'd like. The screenshot above has all of these included.
#### Things to note
- Make sure the paths to the scripts are correct. In my case I put the scripts inside my home directory.
- Change the formatting, icons, padding, underline, intervals, ... to your needs.
- `scripts/spotify/spotify_status.py` returns the play/pause icons
### Currently playing
~~~ ini
[module/spotify]
type = custom/script
interval = 3
format = "%{T1}<label>"
format-padding = 10
exec = python3 ~/scripts/spotify/spotify_status.py
format-underline = #1db954
line-size = 1
~~~
### Play and pause button
~~~ ini
[module/playpause]
type = custom/script
interval = 2
format = "%{T3}<label>"
exec = ~/scripts/spotify/isplaying.sh
format-underline = #1db954
line-size = 1
click-left = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
~~~
### Previous song
~~~ ini
[module/previous]
type = custom/script
interval = 86400
format = "%{T3}<label>"
exec = echo "        "
format-underline = #1db954
line-size = 1
click-left = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
~~~
### Next song
~~~ ini
[module/next]
type = custom/script
interval = 86400
format = "%{T3}<label>"
exec = echo "        "
format-underline = #1db954
line-size = 1
click-left = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
~~~
## Adding all modules
Add all of the desired modules to any bar
~~~ ini
modules-right = spotify previous playpause next
~~~