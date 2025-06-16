#!/bin/sh
sleep 0.5
setxkbmap -option ctrl:nocaps -model pc105 &
lxqt-policykit-agent &
feh --bg-fill ~/.config/wallpaper/black.png &
xset r rate 250 40 & # make scrolling faster.
xrdb -merge ~/.Xresources &
emacs --daemon &
