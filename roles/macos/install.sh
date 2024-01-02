#!/usr/bin/env zsh
set -e


# Desktop & Dock
## Dock > Size: 25%
defaults write com.apple.dock tilesize -int 35
## Dock > Magnification: Off
defaults write com.apple.dock magnification -bool false
## Position on screen: Left
defaults write com.apple.dock orientation -string "left"
## Minimize window using: Genie Effect
defaults write com.apple.dock mineffect -string "genie"
## Double-click a window's title bar to:  Zoom
defaults write -g AppleActionOnDoubleClick -string "Maximize"
## Automatically hide and show the Dock: true
defaults write com.apple.dock autohide -bool true
## Animate opening applications: false
defaults write com.apple.dock launchanim -bool false
## Show indicators for open applications: false
defaults write com.apple.dock show-process-indicators -bool false
## Show recent applications in Dock: false
defaults write com.apple.dock show-recents -bool false
## Dockからすべてのアプリを消す
defaults write com.apple.dock persistent-apps -array


# Keyboard
## Keyboard Shortcuts > Modifier Keys > Caps Lock Key: Control
keyboard_id="$(ioreg -c AppleEmbeddedKeyboard -r | grep -Eiw "VendorID|ProductID" | awk '{ print $4 }' | paste -s -d'-\n' -)-0"
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboard_id} -array-add "
<dict>
  <key>HIDKeyboardModifierMappingDst</key>\
  <integer>30064771300</integer>\
  <key>HIDKeyboardModifierMappingSrc</key>\
  <integer>30064771129</integer>\
</dict>
"


# Siri & Spotlight
## TODO: コード化


# Others
## .DS_Store ファイルを作らせない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

