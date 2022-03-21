#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list ghq > /dev/null 2>&1 || {
  brew install ghq
}

# ~/.gitconfig
# [ghq]
# 	root = ~/src
git config --global ghq.root '~/src'

(
cd ${CURRENT_PATH}
cp -fr .zsh.d ${HOME}
cp -fr bin ${HOME}
chmod +x ${HOME}/bin/*
)

