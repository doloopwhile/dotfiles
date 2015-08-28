#!/bin/bash
set -e
set -x
cd "$HOME/dotfiles"

git submodule update --init

function backup() {
  local path="$1"
  if [ -e "${path}" ]; then
    mv "${path}" "${path}.$(date +'%F_%T')"
  fi
}

names=(
  SciTEUser.properties
  bashrc
  dircolors
  direnvrc
  gitconfig
  gitignore
  gvimrc
  gemrc
  inputrc
  irbrc
  pythonstartup
  tmux.conf
  vim
  vimrc
  zshrc
  cheatsheets
  peco
)


for name in ${names[@]}; do
  backup ~/.$name
  ln -s $(pwd)/_$name ~/.$name
done

backup ~/SciTEStartup.lua
ln -s $(pwd)/SciTEStartup.lua ~/SciTEStartup.lua

mkdir -p ~/.bash.d
pushd _bash.d > /dev/null
  shopt -s nullglob
    for name in *; do
      backup ~/.bash.d/$name
      ln -s $(pwd)/$name ~/.bash.d/$name
    done
  shopt -u nullglob
popd > /dev/null
