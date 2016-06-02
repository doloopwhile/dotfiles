#!/bin/bash
# 便利なコマンド
LS_COMMAND=ls
if which gls &> /dev/null; then
  LS_COMMAND=gls
fi

LS_OPTIONS='-B -v'

if "${LS_COMMAND}" --time-style=long-iso &> /dev/null; then
  LS_OPTIONS="${LS_OPTIONS} --time-style=long-iso"
fi

if "${LS_COMMAND}" --color &> /dev/null; then
  LS_OPTIONS="${LS_OPTIONS} --color=auto"
fi

if "${LS_COMMAND}" --group-directories-first &> /dev/null; then
  LS_OPTIONS="${LS_OPTIONS} --group-directories-first"
fi

# shellcheck disable=SC2139
alias ls="${LS_COMMAND} ${LS_OPTIONS}"
# shellcheck disable=SC2139
alias ll="${LS_COMMAND} -l -h -H -p ${LS_OPTIONS}"

if [ -f ~/.dircolors ] && which dircolors &> /dev/null; then
  eval "$(dircolors ~/.dircolors)"
fi
