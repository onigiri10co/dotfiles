#!/usr/bin/env zsh
set -e


# Install Maccy: https://github.com/p0deje/Maccy
brew list --cask maccy > /dev/null 2>&1 || {
  brew install maccy --cask
}

