#!/usr/bin/env zsh
set -e


brew list --cask dropbox > /dev/null 2>&1 || {
  brew install dropbox --cask
}

