#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list awscli > /dev/null 2>&1 || {
  asdf plugin add awscli
}

asdf install awscli latest
asdf global awscli latest

