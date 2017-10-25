#!/bin/bash
exec 1> >(logger -s -t "$(basename $0) $1") 2>&1
if [ "$1" == "eye01" ]; then
    curl "http://$1/reboot.cgi?loginuse=admin&loginpas=PASSWORD"
elif [ "$1" == "eye02" ]; then
    curl "http://$1/reboot.cgi?loginuse=admin&loginpas=PASSWORD"
elif [ "$1" == "eye03" ]; then
    curl "http://$1/reboot.cgi?loginuse=admin&loginpas=PASSWORD"
else
    echo "Not recognized camera $1"
    exit 1
fi

