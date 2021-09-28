#!/usr/bin/env zsh
set -e


# Install google-japanese-ime
brew list --cask google-japanese-ime > /dev/null 2>&1 || {
  brew install google-japanese-ime --cask
}

