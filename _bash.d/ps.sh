#!/bin/bash
# PS1の設定

function C() {
  case $1 in
  black)    echo -e -n "\033[1;30m";;
  red)      echo -e -n "\033[1;31m";;
  green)    echo -e -n "\033[1;32m";;
  yellow)   echo -e -n "\033[1;33m";;
  blue)     echo -e -n "\033[1;34m";;
  magenta)  echo -e -n "\033[1;35m";;
  cyan)     echo -e -n "\033[1;36m";;
  white)    echo -e -n "\033[1;37m";;
  *) echo -e -n "\033[0m";;
  esac
}

MY_HOST_NAMES=(
  m3-2015mac03
)
MY_HOST_COLORS=(
  cyan
)


function ps1_info() {
  local END_CODE=$?

  echo -n "${USER}@"

  local HOST_COLOR=
  if [ 0 -lt "${#MY_HOST_NAMES[@]}" ]; then
    for (( i=0; i < ${#MY_HOST_NAMES[@]}; i++ )); do
      if [ "$(hostname -s)" = "${MY_HOST_NAMES[$i]}" ]; then
        export HOST_COLOR=${MY_HOST_COLORS[$i]}
        break
      fi
    done
  fi
  echo -n -e "$(C "${HOST_COLOR}")$(hostname -s)\033[0m "

  echo -n "$(date +'%F %H:%M:%S')"
  echo -n ' '

  echo -n '$?='
  if [ 0 -ne ${END_CODE} ]; then
    echo -n "$(C red)${END_CODE}$(C reset)"
  else
    echo -n 0
  fi

  if git status &>/dev/null; then
    echo -n ' git['

    local modified=0
    local cached=0
    local untracked=0

    while read line; do
      if [ "$line" = '_?_?_' ]; then
        untracked=1
        continue
      fi

      if [[ "$line" =~ ^_[^[:space:]]_.?_ ]]; then
        cached=1
      fi

      if [[ "$line" =~ ^_._[^[:space:]]_ ]]; then
        modified=1
      fi
    done < <(git st | cut -b -2 | sed -e 's/\(.\)\(.*\)/_\1_\2_/')

    if [ $modified -ne 0 ]; then
      echo -n "$(C red)M$(C reset)"
    fi

    if [ $cached -ne 0 ]; then
      echo -n "$(C green)C$(C reset)"
    fi

    if [ $untracked -ne 0 ]; then
      echo -n "$(C red)?$(C reset)"
    fi

    echo -n ']='

    local branch
    branch="$(git branch 2>/dev/null | grep '^\*' | sed -e "s/^* //")"
    if [[ "${branch}" =~ ^bug- ]]; then
      C green
    elif [[ "${branch}" =~ ^atc- ]]; then
      C cyan
    elif [[ "${branch}" =~ ^tmp ]]; then
      C magenta
    elif [[ "${branch}" = "(detached from hde/master)" ]]; then
      C yellow
    else
      C white
    fi
    echo -n "${branch}"
    C reset
  fi

  if svn info &> /dev/null; then
    local modified=0
    local untracked=0

    while read line; do
      if [ "${line}" = '?' ]; then
        untracked=1
        continue
      fi
      if [ -n "${line}" ]; then
        modified=1
      fi
    done < <(svn status | cut -b 1)

    echo -n ' svn['
    if [ $modified -ne 0 ]; then
      echo -n "$(C red)M$(C reset)"
    fi

    if [ $untracked -ne 0 ]; then
      echo -n "$(C red)?$(C reset)"
    fi
    echo -n ']'
  fi

  if [ -n "${RAILS_ENV-}" ]; then
    echo -n " RAILS_ENV=$RAILS_ENV"
  fi

  if [ -n "${DOCKER_MACHINE_NAME}" ]; then
    echo -n " docker=$(C white)${DOCKER_MACHINE_NAME}$(C reset)[$(docker-machine ip "${DOCKER_MACHINE_NAME}")]"
  fi

  echo
  echo -n ' '

  pwd | sed -e "s|^${HOME%/}|~|"
}

PS1='$(ps1_info)'

if [ "$(id -u)" -eq 0 ]; then
  PS1="$PS1\n\\[\033[1;31m\\]#\\[\033[0m\\] " # rootの場合はシャープ
else
  PS1="$PS1\n\\[\033[1;${HOST_COLOR}m\\]$\\[\033[0m\\] " # 非rootユーザの場合はドル
fi

export PS1
