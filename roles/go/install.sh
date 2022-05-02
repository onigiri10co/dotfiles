#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list golang > /dev/null 2>&1 || {
  asdf plugin add golang
}

asdf install golang latest
asdf global golang latest

(
cd ${CURRENT_PATH}
cp -fr .zsh.d ${HOME}
)

