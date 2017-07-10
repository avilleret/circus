#!/bin/bash
killall pd

cd ${0%/*}/pd

xfce4-terminal -T "Control" -e "/home/circus/circus/start-control.sh"

sleep 1

xfce4-terminal -T "Subtitle" -e "/home/circus/circus/start-subtitle.sh"

sleep 2