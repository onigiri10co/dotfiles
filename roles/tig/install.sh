#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list tig > /dev/null 2>&1 || {
  brew install tig
}

( 
cd ${CURRENT_PATH}
cp -f .tigrc ${HOME}
)

