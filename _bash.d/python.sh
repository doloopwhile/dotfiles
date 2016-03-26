#!/bin/bash
# Python関連
export PYTHONSTARTUP=~/.pythonstartup
# export PIP_USER=1

if which pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
