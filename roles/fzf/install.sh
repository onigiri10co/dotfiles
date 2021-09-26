#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


# Install fzf
brew list fzf > /dev/null 2>&1 || {
  brew install fzf
  $(brew --prefix)/opt/fzf/install --bin --key-bindings --completion --no-update-rc --no-zsh --no-bash --no-fish
}

( 
cd ${CURRENT_PATH}
cp -fr .zsh.d ${HOME}
cp -fr bin ${HOME}
chmod +x ${HOME}/bin/*
)

