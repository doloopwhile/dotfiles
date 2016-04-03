#!/bin/bash
# go
if [ -z "$GOPATH" ]; then
  export GOPATH=~/gocode
  export PATH=${PATH}:/usr/local/go/bin:$GOPATH/bin
fi

function ghql() {
  p=$(ghq list | fzf)
  if [ $? -ne 0 ]; then
    exit 1
  fi
  ghq look "$p"
}
#
# function gt() {
#   PGUSER=postgres go test "$@" |\
#     colorize RUN --bold |\
#     colorize PASS -f green --bold |\
#     colorize SKIP -f cyan --bold
# }

gotest-color() {
  colorize --bold -f green '\bPASS\b' | \
    colorize --bold -f cyan '\bRUN\b' | \
    colorize --bold -f red '\bFAIL\b'
}
