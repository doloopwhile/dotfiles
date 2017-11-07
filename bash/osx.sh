#!/bin/bash
if which brew &> /dev/null; then
  if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
  fi

  ## Enable GNU command in OSX
  if which gsed &> /dev/null; then
    alias sed=gsed
  fi
fi
