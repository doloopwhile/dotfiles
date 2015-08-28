#!/bin/bash
function C() {
  case $1 in
  black)    echo -e -n "\033[0;30m";;
  red)      echo -e -n "\033[0;31m";;
  green)    echo -e -n "\033[0;32m";;
  yellow)   echo -e -n "\033[0;33m";;
  blue)     echo -e -n "\033[0;34m";;
  magenta)  echo -e -n "\033[0;35m";;
  cyan)     echo -e -n "\033[0;36m";;
  white)    echo -e -n "\033[0;37m";;

  Black)    echo -e -n "\033[1;30m";;
  Red)      echo -e -n "\033[1;31m";;
  Green)    echo -e -n "\033[1;32m";;
  Yellow)   echo -e -n "\033[1;33m";;
  Blue)     echo -e -n "\033[1;34m";;
  Magenta)  echo -e -n "\033[1;35m";;
  Cyan)     echo -e -n "\033[1;36m";;
  White)    echo -e -n "\033[1;37m";;
  *) echo -e -n "\033[0m";;
  esac
}

git log --pretty=format:'%h %s' "$@" | while read line; do
  hash="${line%% *}"
  msg="${line#* }"

  if [[ "$msg" =~ ^Merge\ branch ]]; then
    c="$(C Black)"
  else
    c="$(C white)"
  fi
  echo "$(C yellow)$hash $c$msg$(C)"
done | less -R
