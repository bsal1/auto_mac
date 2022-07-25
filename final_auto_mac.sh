#!/bin/bash
if ( ip route | grep -q "default" )
  then
  c=$(route | grep default | cut -d " " -f 37)
  echo "You are connected via $c."
  sudo ifconfig $c down
  sudo macchanger -a $c
  sudo ifconfig $c up
else
  echo "Not connected to Internet"
fi
