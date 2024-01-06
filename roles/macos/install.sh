#!/usr/bin/env zsh
set -e


# NSGlobalDomain(共通の設定)
## すべてのアプリケーションで共通の設定のドメイン（グローバルドメイン）
## 設定がアプリケーションのドメインで指定されておらず、NSGlobalDomain で指定されている場合、アプリケーションは NSGlobalDomain の値を使用する。
## % defaults read NSGlobalDomain で、現状を参照できる。
## NSGlobalDomain の代わりに、-g OR -globalDomain を使用することもできる。ここでは、-g で統一する。


# Desktop & Dock
## Dock > Size: 35
defaults write com.apple.dock tilesize -int 35
## Dock > Magnification: Off
defaults write com.apple.dock magnification -bool false
## Position on screen: Left
defaults write com.apple.dock orientation -string "left"
## Minimize window using: Genie Effect
defaults write com.apple.dock mineffect -string "genie"
## Double-click a window's title bar to: Zoom
defaults write -g AppleActionOnDoubleClick -string "Maximize"
## Automatically hide and show the Dock: true
defaults write com.apple.dock autohide -bool true
## Animate opening applications: false
defaults write com.apple.dock launchanim -bool false
## Show indicators for open applications: false
defaults write com.apple.dock show-process-indicators -bool false
## Show recent applications in Dock: false
defaults write com.apple.dock show-recents -bool false
## Dock から全てのアプリを削除（ゴミ箱だけにする）※以後は、起動中のアプリだけが Dock に表示される。
defaults write com.apple.dock persistent-apps -array
killall Dock


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


# Finder
## すべての拡張子を表示
defaults write -g AppleShowAllExtensions -bool true
## 隠しファイル・フォルダを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
## ステータスバー表示
# defaults write com.apple.finder ShowStatusBar -bool true
## パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
## タイトルバーにフルパスを表示
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## ゴミ箱を空にするときの警告無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false
## View > as List: 常にリストビューにする（Nlsv:リスト, icnv:アイコン, clmv:カラム, Flwv:カバーフロー）
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
## サイドバーのタグを非表示
defaults write com.apple.finder ShowRecentTags -bool false
killall Finder


# Screen Shot
## スクリーンショット保存先を変更
_screenshotdir="$HOME/Desktop/_ScreenShot"
mkdir -p $_screenshotdir
defaults write com.apple.screencapture location $_screenshotdir
## スクリーンショット名を日付だけにする
defaults write com.apple.screencapture name ""
killall SystemUIServer


# Others
## 未確認ファイルを開く際の警告無効化
# defaults write com.apple.LaunchServices LSQuarantine -bool false
## .DS_Store ファイルを作成しない（ネットワークドライブ）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## .DS_Store ファイルを作成しない（USB ドライブ）
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

