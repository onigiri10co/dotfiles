#!/bin/bash -e


readonly CURRENT_PATH=$(cd $(dirname $0); pwd)


# Install homebrew
type brew > /dev/null 2>&1 || {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

( 
cd $CURRENT_PATH
cp -fr .zsh.d "$HOME/"
)

