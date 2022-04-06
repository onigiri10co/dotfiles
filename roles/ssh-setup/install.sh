#!/usr/bin/env zsh
set -e

[ -L $HOME/.ssh ] && unlink $HOME/.ssh
ln -fs $HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/ssh $HOME
mv -f $HOME/ssh $HOME/.ssh
ssh-add-keys

