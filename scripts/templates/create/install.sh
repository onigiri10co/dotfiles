#!/usr/bin/env zsh
set -e

readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


# brew
# brew list {{ROLE}} > /dev/null 2>&1 || {
#   brew install {{ROLE}}
# }

# brew cask
# brew list --cask {{ROLE}} > /dev/null 2>&1 || {
#   brew install {{ROLE}} --cask
# }

# brew (from my brew repository)
# brew list {{ROLE}} > /dev/null 2>&1 || {
#   brew install --HEAD onigomex/apps/${{ROLE}}
# }

# download zip
# curl -sL https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Caffeine.spoon.zip -# | /usr/bin/tar xz -C ~/.hammerspoon/Spoons/

# script via curl command
# type brew > /dev/null 2>&1 || {
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# }

# asdf
# asdf list {{ROLE}} > /dev/null 2>&1 || {
#   asdf plugin add {{ROLE}}
# }
#
# asdf install {{ROLE}} latest
# asdf global {{ROLE}} latest

# config files
# (
# cd ${CURRENT_PATH}
# cp -fr .zsh.d ${HOME}
# )

# link(){
#   ln -fs $HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs/userdata/aws $HOME/.aws
# }
#
# if [ -L $HOME/.aws ]; then
#   unlink $HOME/.aws
#   link
# fi
#
# if [ ! -e $HOME/.aws ]; then
#   link
# fi
