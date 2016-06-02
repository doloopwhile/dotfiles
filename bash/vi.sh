#!/bin/bash
# エディタ関連
export EDITOR=vi
if which vim &> /dev/null; then
  export EDITOR=vim
  alias vim='vim -p'
  alias vi='vim -p'
  export SVN_EDITOR=vim
fi

if [ -e "/Applications/MacVim.app" ]; then
  export PATH="$PATH:/Applications/MacVim.app/Contents/MacOS"
  alias vi='/Applications/MacVim.app/Contents/MacOS/Vim -p'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  export SVN_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
fi
