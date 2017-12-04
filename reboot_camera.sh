#!/bin/bash
exec 1> >(logger -s -t "$(basename $0) $1") 2>&1
if [ -f /etc/camera/${1}.properties ]; then
  . /etc/camera/${1}.properties
  curl "${URL}?loginuse=${USER}&loginpas=${PASS}"
else
    echo "Not recognized camera $1"
    exit 1 ;;
fi