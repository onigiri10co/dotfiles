#!/usr/bin/env zsh
set -e

link(){
  ln -fs $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/aws $HOME
  mv -f $HOME/aws $HOME/.aws
}

if [ -L $HOME/.aws ]; then
  unlink $HOME/.aws
  link
fi

if [ ! -e $HOME/.aws ]; then
  link
fi

