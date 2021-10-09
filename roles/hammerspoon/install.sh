#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list --cask hammerspoon > /dev/null 2>&1 || {
  brew install hammerspoon --cask 
}

( 
cd ${CURRENT_PATH}
cp -fr .hammerspoon ${HOME}

# Spoons
mkdir -p ${HOME}/.hammerspoon/Spoons

## Caffeine
curl -sL https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Caffeine.spoon.zip -# | /usr/bin/tar xz -C ~/.hammerspoon/Spoons/
)

defaults write -app Terminal AppleLanguages "(en, ja)"

