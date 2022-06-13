#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list zoxide > /dev/null 2>&1 || {
  brew install zoxide
}

(
cd ${CURRENT_PATH}
cp -fr .zsh.d ${HOME}
)

