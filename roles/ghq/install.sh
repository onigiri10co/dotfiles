#!/usr/bin/env bash
set -e


# Install ghq
brew list ghq > /dev/null 2>&1 || {
  brew install ghq
}

# ~/.gitconfig 
# [ghq]
# 	root = ~/src
git config --global ghq.root '~/src'

