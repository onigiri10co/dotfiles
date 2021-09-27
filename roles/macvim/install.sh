#!/usr/bin/env zsh
set -e


# Install macvim
brew list macvim > /dev/null 2>&1 || {
  brew install macvim
}

MACVIM_ABSOLUTE_ROOT_PATH="$(readlink -f $(brew --prefix macvim))"
MACVIM_ABSOLUTE_PATH="${MACVIM_ABSOLUTE_ROOT_PATH}/MacVim.app"

# ref. https://newbedev.com/macvim-is-not-found-by-spotlight
if [[ ! -L ${MACVIM_ABSOLUTE_PATH} && -e ${MACVIM_ABSOLUTE_PATH} ]]; then
  mv -f ${MACVIM_ABSOLUTE_PATH} /Applications/
  ln -fs /Applications/MacVim.app ${MACVIM_ABSOLUTE_ROOT_PATH}/
fi
