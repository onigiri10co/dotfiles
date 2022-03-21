#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list --cask macvim > /dev/null 2>&1 || {
  brew install macvim --cask
}

(
cd ${CURRENT_PATH}
cp -f .zprofile ${HOME}
)

