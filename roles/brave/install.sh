#!/usr/bin/env zsh
set -e


brew list --cask brave-browser > /dev/null 2>&1 || {
  brew install brave-browser --cask
}

