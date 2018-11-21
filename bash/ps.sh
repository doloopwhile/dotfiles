#!/bin/bash
# PS1の設定

C() {
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

ps1_svn() {
  if ! svn info &> /dev/null; then
    return
  fi
  echo -n ' svn'
}

ps1_rails() {
  if [ -z "${RAILS_ENV-}" ]; then
    return
  fi
  echo -n " RAILS_ENV=$(C white)$RAILS_ENV$(C reset)"
}

ps1_play() {
  if [ -z "${PLAY_ENV-}" ]; then
    return
  fi
  echo -n " PLAY_ENV=$(C white)$PLAY_ENV$(C reset)"
}

ps1_skinny() {
  if [ -z "${SKINNY_ENV-}" ]; then
    return
  fi
  echo -n " SKINNY_ENV=$(C white)$SKINNY_ENV$(C reset)"
}

ps1_login() {
  echo -n "${USER}@"
  echo -n -e "$(C "cyan")$(hostname -s)$(C reset)"
}

ps1_date() {
  date +'%F %H:%M:%S'
}

ps1_exit_status() {
  local END_CODE=$1
  echo -n ' $?='
  if [ 0 -ne "${END_CODE}" ]; then
    echo -n "$(C red)${END_CODE}$(C reset)"
  else
    echo -n 0
  fi
}

ps1_git() {
  if ! git status --ignore-submodules &>/dev/null; then
    return
  fi
  echo -n ' '
  git-ps
}

ps1_java() {
  if [ -n "${JAVA_HOME}" ]; then
    local version
    version=$(java -version |& head -1 | cut -d ' ' -f 3 | tr -d '"')
    echo -n " java=$(C white)${version}$(C reset)"
  fi
}

ps1_docker() {
  if [ -z "${DOCKER_MACHINE_NAME}" ]; then
    return
  fi

  local docker_host_ip
  docker_host_ip="${DOCKER_HOST/tcp:\/\//}"
  docker_host_ip="${docker_host_ip/:*/}"
  echo -n " docker=[${docker_host_ip}]"

  if [ -n "${COMPOSE_FILE}" ]; then
    echo -n ","
    echo -n docker-compose.qa-hosted.yml | sed -e 's/^docker-compose.//' -e 's/.yml$//'
  fi
}

ps1_prompt() {
  if [ "$(id -u)" -eq 0 ]; then
    echo -n "$(C red)# $(C reset)"
  else
    echo -n "$(C "${HOST_COLOR}")$ $(C reset)"
  fi
}

ps1_path() {
  echo " $(pwd | sed -e "s|^${HOME%/}|~|")"
}

function ps1_info() {
  local END_CODE=$?
  echo "$(ps1_login)$(ps1_exit_status "$END_CODE")$(ps1_git)$(ps1_svn)$(ps1_rails)$(ps1_skinny)$(ps1_play)$(ps1_java)$(ps1_docker)"
  echo "$(ps1_date)$(ps1_path)"
}

PS1='$(ps1_info)'


# カーソル位置がずれる問題を回避するため、ここの部分だけは文字列連結にする
if [ "$(id -u)" -eq 0 ]; then
  PS1="${PS1}\n\[$(C red)\]#\[$(red)\] " # rootの場合はシャープ
else
  PS1="${PS1}\n\[$(C cyan)\]\$\[$(C reset)\] " # 非rootユーザの場合はドル
fi

export PS1
