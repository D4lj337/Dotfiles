#!/bin/sh

addr="$HOME/.config/wallpaper/"
file=$(ls $addr | shuf -n 1)

# Pywal
wal -i $addr/$file

#qtile cmd-obj -o cmd -f restart

exit
