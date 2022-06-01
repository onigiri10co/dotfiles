#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list ruby > /dev/null 2>&1 || {
  asdf plugin add ruby
}

asdf install ruby latest
asdf global ruby latest

