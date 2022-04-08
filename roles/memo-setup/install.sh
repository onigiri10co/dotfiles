#!/usr/bin/env zsh
set -e

link(){
  ln -fs $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/memo $HOME
}

if [ -L $HOME/memo ]; then
  unlink $HOME/memo
  link
fi

if [ ! -e $HOME/memo ]; then
  link
fi

