#!/usr/bin/env bash 

sleep 3

inkscape_pid=$(ps -ef | grep inkscape | grep svg | grep home | awk '{print $2}')

while [[ -n "$inkscape_pid" ]]
do 
    printf "Inkscape PID = %s\n"  "$inkscape_pid"
    count=$(ls -1 /tmp/*.tex 2>/dev/null | wc -l)
        while [ "$count" != 0 ]
        do
           i3-msg "[instance=\"popup-bottom-center\"] floating enable" 
           i3-msg "[instance=\"popup-bottom-center\"] move absolute position 690 920"
           count=$(ls -1 /tmp/*.tex 2>/dev/null | wc -l)
        done
    sleep 1
    inkscape_pid=$(ps -ef | grep inkscape | grep svg | grep home | awk '{print $2}')
done

inkscape_shortcut_pid=$(ps -ef | grep python3 | grep inkscape-shortcut | awk '{print $2}') 

if [[ -n "$inkscape_shortcut_pid" ]];
then
    echo "$inkscape_shortcut_pid" 
    kill -15 "$inkscape_shortcut_pid"
    echo "shorcut killed" 
fi

