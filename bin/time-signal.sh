#!/bin/bash
while true; do
  if [ $(date +%M%S) = '0057' ]; then
    beep -f 440 -l 100
    sleep 0.9
    beep -f 440 -l 100
    sleep 0.9
    beep -f 440 -l 100
    sleep 0.9
    beep -f 880 -l 1000
  elif [ $(date +%M%S) = '3000' ]; then
    beep -f 880 -l 500
    sleep 1
  fi
  sleep 0.1
done
