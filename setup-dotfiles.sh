#!/bin/bash
cd $HOME

pushd dotfiles
  ./ln-dotfiles.sh
  git submodule update --init
popd

mkdir -p .bash.d
pushd .bash.d
  ln -f -s $HOME/hde-dotfiles/_bash.d/host_colors.sh
popd
