#!/bin/bash
if command -v brew &> /dev/null; then
  prefix="$(brew --prefix)"
  if [ -f "$prefix/etc/bash_completion" ]; then
    . "$prefix/etc/bash_completion"
  fi

  export PATH="$PATH:/usr/local/Cellar/terminal-notifier/2.0.0/bin/"

  ## Enable GNU command in OSX
  if which gsed &> /dev/null; then
    alias sed=gsed
  fi

#      zlib
#      readline
#      openssl
#      sqlite3

  #   export CFLAGS="$CFLAGS -I$prefix/opt/$lib/include"
  #   export LDFLAGS="$LDFLAGS -L$prefix/opt/$lib/lib"
  # done


  for l in zlib readline openssl sqlite3; do
    export LDFLAGS="$LDFLAGS -L/usr/local/opt/$l/lib"
    export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/$l/include"
  done
fi
