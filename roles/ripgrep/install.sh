#!/usr/bin/env zsh
set -e


brew list ripgrep > /dev/null 2>&1 || {
  brew install ripgrep
}

