#!/bin/sh
for f in "$@"; do
  notify-send -t 1000 "${f##*/} を展開しています"
  unar -r "$f"
  if [ $? -eq 0 ]; then
    notify-send "${f##*/} を展開しました"
    trash "$f" 
  else
    notify-send "${f##*/} の展開に失敗しました"
  fi
done
