#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


type memo > /dev/null 2>&1 || {
  go get github.com/mattn/memo
}

( 
cd ${CURRENT_PATH}
cp -fr .config ${HOME}
cp -p _memo ~/.zsh.d/completion
cp -fr .zsh.d ${HOME}/
)

ln -fs ~/Dropbox/memo $HOME
ln -fs $HOME/.config/memo/template.txt $HOME/.config/memo/md.txt  

