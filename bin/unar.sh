#!/bin/sh
for f in "$@"; do
  unar -r "$f"
  if [ $? -eq 0 ]; then
    notify-send "${f##*/} を展開しました"
  else
    notify-send "${f##*/} の展開に失敗しました"
  fi
done
