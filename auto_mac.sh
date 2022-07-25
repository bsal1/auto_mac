#!/bin/bash
if ( ip route | grep -q "default" )
  then
  ven=$(macchanger -l | shuf -n 1 | cut -d " " -f 3 )  
  user=$(printf "%02x:%02x:%02x" $[RANDOM%255] $[RANDOM%255] $[RANDOM%255])
  c=$(route | grep default | cut -d " " -f 37)
  echo "You are connected via $c."
  sudo ifconfig $c down
  sudo macchanger -m "$ven:$user" $c
  sudo ifconfig $c up
else
  echo "Not connected to Internet"
fi
