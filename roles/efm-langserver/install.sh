#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list efm-langserver > /dev/null 2>&1 || {
  brew install efm-langserver
}

( 
cd ${CURRENT_PATH}
cp -fr .zsh.d ${HOME}/
cp -fr .config ${HOME}/
)

