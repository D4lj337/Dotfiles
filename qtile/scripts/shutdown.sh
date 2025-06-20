#!/usr/bin/sh

ACTIONS=("logout\nrestart\nshutdown\nlock\nsuspend")
CHOICE="$(echo -e $ACTIONS | dmenu -p 'Action: ' -nb "#000000" -nf "#ffffff" -sb "#ffffff" -sf "#000000")"

if [ "$CHOICE" == "logout" ]
then
	# that's the only way I found to not having any random mpd script
	# running
	killall -u $USER

elif [ "$CHOICE" == "restart" ]
then
	systemctl reboot

elif [ "$CHOICE" == "shutdown" ]
then
	systemctl poweroff

elif [ "$CHOICE" == "lock" ]
then
	slock &
	while :
	do
		if [ "$(pstree | grep slock)" != "" ]
		then
			sleep 5s

		else
			$HOME/.local/bin/dwm_refresh_status.sh
			exit

		fi
	done

elif [ "$CHOICE" == "suspend" ]
then
	$HOME/.local/bin/suspend.sh

fi
