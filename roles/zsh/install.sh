#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)
readonly NORD_DIR_REPO='github.com/arcticicestudio/nord-dircolors'


brew list zsh > /dev/null 2>&1 || {
  brew install zsh
}

(
cd ${CURRENT_PATH}
cp -f .zshrc ${HOME}
cp -fr .zsh.d ${HOME}
cp -fr bin ${HOME}
chmod +x ${HOME}/bin/*
)

mkdir -p ~/.zsh.d/completion

# Color Settings: dircolors
if [[ ! -e $(ghq root)/${NORD_DIR_REPO} ]]; then
  ghq get https://${NORD_DIR_REPO}
  ln -fsr $(ghq list --full-path ${NORD_DIR_REPO})/src/dir_colors ~/.dir_colors
fi

