#!/bin/sh

# set locale environment
LANG="en_US.UTF-8"
LC_COLLATE="pt_PT.UTF-8"
LC_CTYPE="pt_PT.UTF-8"
LC_MESSAGES="pt_PT.UTF-8"
LC_MONETARY="pt_PT.UTF-8"
LC_NUMERIC="pt_PT.UTF-8"
LC_TIME="pt_PT.UTF-8"
export LANG LC_COLLATE LC_CTYPE LC_MESSAGES LC_MONETARY LC_NUMERIC LC_TIME

# start XScreenSaver
xscreensaver -no-splash &

# set the X cursor
xsetroot -cursor_name left_ptr &

# norwegian keyboard layout
setxkbmap pt

# set keyboard speed
xset r rate 200 30

# map Esc to the CapsLock key
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# start urxvt-daemon
#urxvtd -q -f -o

# remove idle mouse pointer
unclutter &

# start rxvt terminal 1
#exec rxvt-xterm &

# start xmonad session
exec ck-launch-session xmonad
#exec xmonad


