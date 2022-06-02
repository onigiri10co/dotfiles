#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list nodejs > /dev/null 2>&1 || {
  asdf plugin add nodejs
}

asdf install nodejs latest
asdf global nodejs latest

