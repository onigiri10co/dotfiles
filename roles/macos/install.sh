#!/usr/bin/env zsh
set -e


# NSGlobalDomain(共通の設定)
## すべてのアプリケーションで共通の設定のドメイン（グローバルドメイン）
## 設定がアプリケーションのドメインで指定されておらず、NSGlobalDomain で指定されている場合、アプリケーションは NSGlobalDomain の値を使用する。
## % defaults read NSGlobalDomain で、現状を参照できる。
## NSGlobalDomain の代わりに、-g OR -globalDomain を使用することもできる。ここでは、-g で統一する。


# See: https://github.com/jmalloc/dotfiles/issues/12
plist_set_or_add () {
  /usr/libexec/PlistBuddy -c "Set $1" "${@:2}" ||
  /usr/libexec/PlistBuddy -c "Add $1" "${@:2}" ||
  echo "Unable to set or add plist with args:" "$@"
}


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
## Function Keys > Use F1,F2, etc. kyes as standard function keys: true
defaults write -g com.apple.keyboard.fnState -bool true


# Siri & Spotlight
## Search results
### FIXME: まともに動かないのでいつか修正する。 See: https://github.com/search?q=defaults+write+com.apple.spotlight+orderedItems&type=code
# defaults write com.apple.spotlight orderedItems -array \
#   '{ "enabled" = 1; "name" = "APPLICATIONS"; }' \
#   '{ "enabled" = 1; "name" = "MENU_EXPRESSION"; }' \
#   '{ "enabled" = 0; "name" = "CONTACT"; }' \
#   '{ "enabled" = 0; "name" = "MENU_CONVERSION"; }' \
#   '{ "enabled" = 0; "name" = "MENU_DEFINITION"; }' \
#   '{ "enabled" = 0; "name" = "DOCUMENTS"; }' \
#   '{ "enabled" = 0; "name" = "EVENT_TODO"; }' \
#   '{ "enabled" = 1; "name" = "DIRECTORIES"; }' \
#   '{ "enabled" = 0; "name" = "FONTS"; }' \
#   '{ "enabled" = 0; "name" = "IMAGES"; }' \
#   '{ "enabled" = 0; "name" = "MESSAGES"; }' \
#   '{ "enabled" = 0; "name" = "MOVIES"; }' \
#   '{ "enabled" = 0; "name" = "MUSIC"; }' \
#   '{ "enabled" = 0; "name" = "MENU_OTHER"; }' \
#   '{ "enabled" = 0; "name" = "PDF"; }' \
#   '{ "enabled" = 0; "name" = "PRESENTATIONS"; }' \
#   '{ "enabled" = 0; "name" = "MENU_SPOTLIGHT_SUGGESTIONS"; }' \
#   '{ "enabled" = 0; "name" = "SPREADSHEETS"; }' \
#   '{ "enabled" = 1; "name" = "SYSTEM_PREFS"; }' \
#   '{ "enabled" = 0; "name" = "TIPS"; }' \
#   '{ "enabled" = 0; "name" = "BOOKMARKS"; }'


# Desktop > Show View Options
## Sort By: Name
plist_set_or_add ":DesktopViewSettings:IconViewSettings:arrangeBy name" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":FK_StandardViewSettings:IconViewSettings:arrangeBy name" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":StandardViewSettings:IconViewSettings:arrangeBy name" "$HOME/Library/Preferences/com.apple.finder.plist"
## Icon size: 20 x 20
plist_set_or_add ":DesktopViewSettings:IconViewSettings:iconSize 20" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":FK_StandardViewSettings:IconViewSettings:iconSize 20" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":StandardViewSettings:IconViewSettings:iconSize 20" "$HOME/Library/Preferences/com.apple.finder.plist"
## Grid spacing: max(=100)
plist_set_or_add ":DesktopViewSettings:IconViewSettings:gridSpacing 100" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":FK_StandardViewSettings:IconViewSettings:gridSpacing 100" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":StandardViewSettings:IconViewSettings:gridSpacing 100" "$HOME/Library/Preferences/com.apple.finder.plist"
## Text size: 10
plist_set_or_add ":DesktopViewSettings:IconViewSettings:textSize 10" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":FK_StandardViewSettings:IconViewSettings:textSize 10" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":StandardViewSettings:IconViewSettings:textSize 10" "$HOME/Library/Preferences/com.apple.finder.plist"
## Label position: Right
plist_set_or_add ":DesktopViewSettings:IconViewSettings:labelOnBottom false" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":FK_StandardViewSettings:IconViewSettings:labelOnBottom false" "$HOME/Library/Preferences/com.apple.finder.plist"
plist_set_or_add ":StandardViewSettings:IconViewSettings:labelOnBottom false" "$HOME/Library/Preferences/com.apple.finder.plist"


# Finder
## View > as List: 常にリストビューにする（Nlsv:リスト, icnv:アイコン, clmv:カラム, Flwv:カバーフロー）
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
## タイトルバーにフルパスを表示
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
## パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
## ステータスバー表示
# defaults write com.apple.finder ShowStatusBar -bool true
## プレビューウィンドウを表示
defaults write com.apple.finder ShowPreviewPane -bool true
## サイドバーのタグを非表示
defaults write com.apple.finder ShowRecentTags -bool false
## すべての拡張子を表示
defaults write -g AppleShowAllExtensions -bool true
## 隠しファイル・フォルダを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
## ゴミ箱を空にするときの警告無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false
## パスパーを HOME から表示
defaults write com.apple.finder PathBarRootAtHome -bool true
## カレントディレクトリ内を検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
## 拡張子変更時の警告を無視
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
killall Finder


# Screen Shot
## 画像の影を無効化
# defaults write com.apple.screencapture "disable-shadow" -bool true
## 撮影時のサムネイル表示
# defaults write com.apple.screencapture "show-thumbnail" -bool false
## スクリーンショットを jpg で保存
# defaults write com.apple.screencapture type -string "jpg"
## スクリーンショット保存先を変更
_screenshotdir=$HOME/Desktop/_ScreenShot
mkdir -p $_screenshotdir
defaults write com.apple.screencapture location -string "$_screenshotdir"
## スクリーンショット名を日付だけにする
defaults write com.apple.screencapture name ""
killall SystemUIServer


# Feedback
## クラッシュレポート無効化
defaults write com.apple.CrashReporter DialogType -string "none"
## フィードバックを送信しない
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool false


# Terminal
## Install ColorScheme for Terminal.app
_profile='Nord'
_profile_file="${_profile}.terminal"
_profile_dir="$HOME/.config/colorscheme"
_profile_url="https://raw.githubusercontent.com/arcticicestudio/nord-terminal-app/develop/src/xml/${_profile_file}"
mkdir -p "${_profile_dir}"
curl -sL -o "${_profile_dir}/${_profile_file}" "${_profile_url}"
# open ${_profile_dir}/${_profile_file}

## Profile > Default, Startup
# defaults write com.apple.Terminal "Default Window Settings" -string "${_profile}"
# defaults write com.apple.Terminal "Startup Window Settings" -string "${_profile}"
## Shell > When the shell exits: Close the window
# /usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:shellExitAction integer 0" $HOME/Library/Preferences/com.apple.Terminal.plist
## Advanced > Bell: OFF
# /usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:Bell bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
# /usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:VisualBell bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
# /usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:BellBadge bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
# /usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:BellBounce bool false" $HOME/Library/Preferences/com.apple.Terminal.plist

cat << EOF
# Execute the following commands manually.
open ${_profile_dir}/${_profile_file}
defaults write com.apple.Terminal "Default Window Settings" -string "${_profile}"
defaults write com.apple.Terminal "Startup Window Settings" -string "${_profile}"
/usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:shellExitAction integer 0" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:Bell bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:VisualBell bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:BellBadge bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':${_profile}:BellBounce bool false" $HOME/Library/Preferences/com.apple.Terminal.plist
EOF


# Battery
## バッテリーを%表示
# defaults write com.apple.menuextra.battery ShowPercent -string "YES"


# Security
## ファイアウォールon
# defaults write /Library/Preferences/com.Apple.alf globalstate -int 1


# Others
## 未確認ファイルを開く際の警告無効化
# defaults write com.apple.LaunchServices LSQuarantine -bool false
## .DS_Store ファイルを作成しない（ネットワークドライブ）
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
## .DS_Store ファイルを作成しない（USB ドライブ）
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
## 自動で頭文字を大文字にしない
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
## スペルの訂正を無効にする
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"
## Googleのパブリック DNS を使用
# networksetup -setdnsservers Wi-Fi 2001:4860:4860::8844 2001:4860:4860::8888 8.8.4.4 8.8.8.8

