#!/bin/bash
#git関連
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export PATH=$PATH:$HOME/.git-hooker/bin
export GITHUB_USER=doloopwhile
if which hub &> /dev/null; then
  eval "$(hub alias -s)"
  alias g=hub
else
  alias g=git
fi

alias gg='git grep -H --heading --break -I --ignore-case'
