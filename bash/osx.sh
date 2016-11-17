#!/bin/bash
if which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
fi

## Enable GNU command in OSX
if which gsed &> /dev/null; then
  alias sed=gsed
fi
