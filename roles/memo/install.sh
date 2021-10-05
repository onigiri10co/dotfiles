#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


# Install mattn/memo
type memo > /dev/null 2>&1 || {
  go get github.com/mattn/memo
}

( 
cd ${CURRENT_PATH}
cp -fr .config ${HOME}
)

ln -fs ~/Dropbox/memo $HOME

