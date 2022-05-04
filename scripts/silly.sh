#!/usr/bin/env bash 

sleep 3

inkscape_pid=$(ps -ef | grep inkscape | grep svg | grep home | grep -oP '(?<=lalapopa)[ ]*\d+')

while [[ -n ${inkscape_pid} ]]
do 
    printf "Inkscape PID = %s\n"  "$inkscape_pid"
    count=$(ls -1 /tmp/*.tex 2>/dev/null | wc -l)
        while [ $count != 0 ]
        do
           i3-msg "[instance=\"popup-bottom-center\"] floating enable" 
           i3-msg "[instance=\"popup-bottom-center\"] move absolute position 690 920"
           count=$(ls -1 /tmp/*.tex 2>/dev/null | wc -l)
        done
    sleep 1
    inkscape_pid=$(ps -ef | grep inkscape | grep svg | grep home | grep -oP '(?<=lalapopa)[ ]*\d+')
done

inkscape_shortcut_pid=$(ps -ef | grep python3 | grep inkscape-shortcut | grep -oP '(?<=lalapopa)[ ]*\d+')

if [ ! -z "$inkscape_shortcut_pid" ];
then
    echo "$inkscape_shortcut_pid"
    pkill -f 'python3 /home/lalapopa/.dotfiles/scripts/inkscape-shortcut-manager/main.py'
    echo "shorcut killed" 
fi

