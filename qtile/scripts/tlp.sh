#!/bin/bash

# Get TLP profile from tlp-stat -s
#tlp-stat -s | awk '/Profile=/ {print $NF}'

#echo "TLP Profile:"
#tlp-stat -s | awk '/TLP profile/ {print $NF}'
#tlp-stat -s | awk -F'=' '/TLP profile/ {print $2}' | xargs

# Get current TLP profile

PROFILE=$(tlp-stat -s | awk -F'=' '/TLP profile/ {print $2}' | xargs)

if [ -z "$PROFILE" ]; then
    echo "unknown"
else
    echo "$PROFILE"
fi
