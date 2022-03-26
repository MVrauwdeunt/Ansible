#!/bin/bash

oldcmd=" "
while :
do
        cmd=$(/opt/vc/bin/tvservice -n 2>&1)
        if [[ $cmd == *'No device present'* && $cmd != $oldcmd ]]
        then
                # echo TV OFF
                $(sudo /usr/bin/mosquitto_pub -h 192.168.178.250 -p 1883 -u Kodi -P VPU33SQsf80XOpW1PkRU -t "home/woonkamer/output/tv" -m "Uit")
                oldcmd=$cmd
        elif [[ "$cmd" != "$oldcmd" ]] ; then


                # echo TV ON
                $(sudo /usr/bin/mosquitto_pub -h 192.168.178.250 -p 1883 -u Kodi -P VPU33SQsf80XOpW1PkRU -t "home/woonkamer/output/tv" -m "Aan")
                oldcmd=$cmd
        fi


        # echo $cmd $oldcmd
        sleep 10
done
