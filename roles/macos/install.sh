#!/usr/bin/env zsh
set -e


# .DS_Store ファイルを作らせない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

