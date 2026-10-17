#!/bin/bash

ps aux | dmenu -nb "#000000" -nf "#ffffff" -sb "#ffffff" -sf "#000000" -p 'kill process' -l 20 | awk '{print $2}' | xargs kill -9
