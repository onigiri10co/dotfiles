#!/usr/bin/env zsh
set -e


brew list --cask macvim > /dev/null 2>&1 || {
  brew install macvim --cask
}

