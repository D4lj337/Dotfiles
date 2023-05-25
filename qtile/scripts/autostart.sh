#!/bin/sh

setxkbmap -option ctrl:nocaps -model pc105 &
lxqt-policykit-agent &
feh --bg-fill ~/.config/wallpaper/black.png & 
#./.config/qtile/scripts/pywal.sh & 
emacs --daemon &

exit
