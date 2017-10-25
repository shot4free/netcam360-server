#!/bin/bash -e
exec 1> >(logger -s -t "$(basename $0) $1") 2>&1
SIZE1=$(du -sb /home/camera/$1 | cut -f1)
sleep 5
SIZE2=$(du -sb /home/camera/$1 | cut -f1)

if [ $SIZE1 -eq $SIZE2 ]
then
    echo "Size of $1 is not increasing, probably not recording"
    if [ ! -f /tmp/$1 ]
        then
        touch /tmp/$1
#        /usr/local/bin/slackcat -n beholder "Size of $1 is not increasing, probably not recording. Rebooting."
        /usr/local/bin/reboot_camera.sh $1
        fi
    exit 1
else
    echo "Size of $1 is increasing, probably recording"
    if [ -f /tmp/$1 ]
        then
        rm -f /tmp/$1
#        /usr/local/bin/slackcat -n beholder "Size of $1 is increasing, probably recording"
        fi
    exit 0
fi

