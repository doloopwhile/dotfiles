#!/bin/bash
# エディタ関連
export EDITOR=vi
if [ -e "/Applications/MacVim.app" ]; then
  alias vi=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  export SVN_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
elif which vim &> /dev/null; then
  alias vi='vim -p'
  alias vim='vim -p'
  export EDITOR=vim
  export SVN_EDITOR=vim
fi
