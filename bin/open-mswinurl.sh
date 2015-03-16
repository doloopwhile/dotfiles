#!/bin/sh
export PATH=/bin:/usr/bin:/usr/local/bin
gnome-open $(grep -E '^URL=(.*)' "$@" | sed -e 's/URL=//')
