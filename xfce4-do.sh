#!/bin/bash
APP="xfce4-appfinder"
PID=$(pidof $APP)
if [ -n "$PID" ]; then
  kill $PID &>/dev/null
fi
$APP &>/dev/null
