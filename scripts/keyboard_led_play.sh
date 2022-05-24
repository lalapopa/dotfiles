#!/usr/bin/env bash 


while true
do
    for i in  0 1 2
    do 
        echo "$i" > /sys/class/leds/tpacpi::kbd_backlight/brightness
        sleep 1.3 
    done
done 



