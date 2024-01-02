#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list java > /dev/null 2>&1 || {
  asdf plugin add java
}

asdf install java latest:corretto
asdf global java latest:corretto
# asdf install java latest:corretto-8
# asdf install java latest:corretto-11
# asdf install java latest:corretto-21
