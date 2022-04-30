#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list kubernetes-cli > /dev/null 2>&1 || {
  brew install kubernetes-cli
}

