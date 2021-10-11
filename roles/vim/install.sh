#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


brew list vim > /dev/null 2>&1 || {
  brew list macvim > /dev/null 2>&1 && {
    brew unlink macvim
  }
  brew install vim
}

# Install vim-plug
curl -sSfLo ~/.vim/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

( 
cd ${CURRENT_PATH}
cp .vimrc ${HOME}
cp -fr .config ${HOME}
)

# for neoclide/coc.nvim
npm ls -g yarn > /dev/null 2>&1 || {
  npm install -g yarn
}

