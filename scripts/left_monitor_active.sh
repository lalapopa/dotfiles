#!/bin/env bash  

function display_connect() {
    xrandr --output eDP --primary --mode 1920x1080 --pos 973x1080 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --off 
}

function display_disconnect() {
    xrandr --output HDMI-A-0 --off
}

dis_switch=1
con_switch=0


all_process=$(ps -ef | grep bash | grep "/home/lalapopa/.screenlayout/left_monitor_active.sh" | awk '{print $2}')
process_amount=$(echo "${all_process}" | wc -l)

if [ "$process_amount" -gt 2 ]; then
    echo "${all_process}" | head -"$(($process_amount-2))" | xargs kill -15
fi

while true; do
connected=$(xrandr | grep 'HDMI-A-0 connected')
disconnected=$(xrandr | grep 'HDMI-A-0 disconnected')
if [[ "$dis_switch" == 1 ]]; then
if [[ -n "$connected" ]]; then
    display_connect
    con_switch=1
    dis_switch=0
fi
fi

if [[ "$con_switch" == 1 ]]; then
if [[ -n "$disconnected" ]]; then
    display_disconnect
    dis_switch=1
    con_switch=0
fi
fi
sleep 1
done

