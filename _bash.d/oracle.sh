#!/bin/bash
if [ "$(hostname)" = "m3-2015mac03.office.so-netm3.com" ]; then
  export ORACLE_HOME=$HOME/instantclient_11_2/
  export PATH="$PATH:$ORACLE_HOME"
  export DYLD_LIBRARY_PATH=$ORACLE_HOME:$DYLD_LIBRARY_PATH
  export NLS_LANG=American_America.JA16EUCTILDE
  export TNS_ADMIN=$ORACLE_HOME/admin/network
fi
