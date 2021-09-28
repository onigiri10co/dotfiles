#!/usr/bin/env zsh
set -e


# Install dropbox
brew list --cask dropbox > /dev/null 2>&1 || {
  brew install dropbox --cask
}

