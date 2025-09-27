#!/bin/bash

if emacsclient -e '(+ 1 1)' &>/dev/null; then
    echo "Daemon Up"
else
    echo "Daemon Up"
fi
