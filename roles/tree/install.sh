#!/usr/bin/env zsh
set -e


brew list tree > /dev/null 2>&1 || {
  brew install tree
}

