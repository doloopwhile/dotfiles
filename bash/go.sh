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
