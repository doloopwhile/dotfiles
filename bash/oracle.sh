#!/bin/bash
ORACLE_HOME=$HOME/instantclient_11_2/

if [ -d "$ORACLE_HOME" ]; then
  export ORACLE_HOME
  export PATH="$PATH:$ORACLE_HOME"
  export LD_LIBRARY_PATH=$ORACLE_HOME:$LD_LIBRARY_PATH
  export NLS_LANG=American_America.JA16EUCTILDE
  export TNS_ADMIN=$ORACLE_HOME/admin/network
fi
