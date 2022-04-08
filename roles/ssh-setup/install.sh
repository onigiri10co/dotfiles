#!/usr/bin/env zsh
set -e

link(){
  ln -fs $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/ssh $HOME
  mv -f $HOME/ssh $HOME/.ssh
  ssh-add-keys
}

if [ -L $HOME/.ssh ]; then
  unlink $HOME/.ssh
  link
fi

if [ ! -e $HOME/.ssh ]; then
  link
fi

