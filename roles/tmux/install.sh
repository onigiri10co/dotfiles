#!/usr/bin/env bash
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


# Install tmux
brew list tmux > /dev/null 2>&1 || {
  brew install tmux
}

# Install reattach-to-user-namespace
brew list reattach-to-user-namespace > /dev/null 2>&1 || {
  brew install reattach-to-user-namespace
}

# Install ansifilter (for tmux-plugins/tmux-logging)
brew list ansifilter > /dev/null 2>&1 || {
  brew install ansifilter
}

[[ -e ~/.tmux/plugins/tpm ]] || {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

( 
cd ${CURRENT_PATH}
cp .tmux.conf ${HOME}/
cp -fr .zsh.d ${HOME}/
cp -fr bin ${HOME}/
chmod +x ${HOME}/bin/*
)

