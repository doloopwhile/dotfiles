#!/bin/bash
#git関連
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export PATH=$PATH:$HOME/.git-hooker/bin
export GITHUB_USER=doloopwhile
if which hub &> /dev/null; then
  eval "$(hub alias -s)"
  alias g=hub
else
  alias g=git
fi

alias gg='git grep -H --heading --break -I --ignore-case'

# git
alias g=git
alias gi=git
alias gst='git status -s'
alias gb='git branch'
alias gbe='git be'
alias gc='git co'
alias c=git-c
