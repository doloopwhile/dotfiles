#!/bin/bash
# エディタ関連

if which vim &> /dev/null; then
  alias vim='vim -p'
  alias vi='vim -p'
fi

if [ -e "/Applications/MacVim.app" ]; then
  export PATH="$PATH:/Applications/MacVim.app/Contents/MacOS"
  alias vi='/Applications/MacVim.app/Contents/MacOS/Vim -p'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
fi
