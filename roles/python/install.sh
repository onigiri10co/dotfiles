#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list python > /dev/null 2>&1 || {
  asdf plugin add python
}

asdf install python latest
asdf global python latest

