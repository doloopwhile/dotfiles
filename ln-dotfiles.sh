#!/bin/bash
h=$HOME
d="$HOME/dotfiles"
date=$(date +'%F_%T')

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
  percol.d
  pythonstartup
  tmux.conf
  vim
  vimrc
  zshrc
)

for name in ${names[@]}; do
  if [ -e $h/.$name ]; then
    mv $h/.$name{,.bak.$date}
  fi
  ln -s $d/_$name $h/.$name
done

if [ -e $h/SciTEStartup.lua ]; then
  mv $h/SciTEStartup.lua{,.bak.$date}
fi
ln -s $d/SciTEStartup.lua $h/SciTEStartup.lua
