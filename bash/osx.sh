#!/bin/bash
if which brew &> /dev/null; then
  if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
  fi

  export PATH="$PATH:/usr/local/Cellar/terminal-notifier/2.0.0/bin/"

  ## Enable GNU command in OSX
  if which gsed &> /dev/null; then
    alias sed=gsed
  fi
fi
