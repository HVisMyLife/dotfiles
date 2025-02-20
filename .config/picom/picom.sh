#!/usr/bin/env sh

while true
do 
  if ps -e | grep picom
  then 
    echo "OK";
  else
    echo "NOT OK";
    picom  -b --config ~/.config/picom/picom.conf &
  fi
  sleep 5
done

