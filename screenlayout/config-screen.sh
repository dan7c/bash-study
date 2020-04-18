#!/usr/bin/env bash

if [ ! -d ~/screenlayout ] 
then
	mkdir ~/screenlayout 
fi

xrandr > ~/screenlayout/output.txt

con_monitors=$(grep -o -i " connected " ~/screenlayout/output.txt | wc  -l)

	if [ $con_monitors -eq 2 ]
	then
		xrandr --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal --output eDP-1 --mode 1366x768 --pos 0x312 --rotate normal

		notify-send -i face-smile-big "Monitor position fixed succesfully!"
	else 
		notify-send -i face-uncertain "Dual screen not identified."
	fi

