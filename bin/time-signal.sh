#!/bin/bash
# while true; do
#   if [ $(date +%M%S) = '0057' ]; then
#     beep -f 440 -l 100
#     sleep 0.9
#     beep -f 440 -l 100
#     sleep 0.9
#     beep -f 440 -l 100
#     sleep 0.9
#     beep -f 880 -l 1000
#   elif [ $(date +%M%S) = '3000' ]; then
#     beep -f 880 -l 500
#     sleep 1
#   fi
#   sleep 0.1
# done

while true; do
  f1=1100
  f2=550
  if [ $(date +%M%S) = '0000' ]; then
    h=$(date +%I)
    if [ $h -eq 0 ]; then
      h=12
    fi
    for i in $(seq $h); do
      beep -f $f1 -l 200
      beep -f $f2 -l 200
      sleep 0.6
    done
    sleep 1
  elif [ $(date +%M%S) = '3000' ]; then
    beep -f $f1 -l 200
    sleep 0.4
    beep -f $f2 -l 400
    sleep 1
  fi
  sleep 0.3
done
