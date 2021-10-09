#!/usr/bin/env zsh
set -e


brew list --cask maccy > /dev/null 2>&1 || {
  brew install maccy --cask
}

