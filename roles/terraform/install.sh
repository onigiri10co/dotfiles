#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


asdf list terraform > /dev/null 2>&1 || {
  asdf plugin add terraform
}

asdf install terraform latest
asdf global terraform latest


brew list terraformer > /dev/null 2>&1 || {
  brew install terraformer
}

brew list tflint > /dev/null 2>&1 || {
  brew install tflint
}

brew list tfsec > /dev/null 2>&1 || {
  brew install tfsec
}

brew list terraformer > /dev/null 2>&1 || {
  brew install terraformer
}
