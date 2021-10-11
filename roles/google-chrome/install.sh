#!/usr/bin/env zsh
set -e


brew list --cask google-chrome > /dev/null 2>&1 || {
  brew install google-chrome --cask
}

