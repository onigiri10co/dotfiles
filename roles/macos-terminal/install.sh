#!/usr/bin/env zsh
set -e

# TODO: shellExitAction が設定できてない。また今度調べる。とりあえず、手動で設定する。あと、設定後に自動で open した terminal も閉じたい。
# 参考になりそうなサイト
#
# /usr/libexec/PlistBuddy: 
# https://gist.github.com/cseelye/5d54ca5d014619aed58cafd551149ab3
# https://kumos.hatenablog.com/entry/2018/03/06/222717
# https://ughe.github.io/2020/04/29/terminal-part-2
#
# defaults write com.apple.Terminal.plist:
# http://blog.livedoor.jp/blackwingcat/archives/1584740.html
# https://qiita.com/djmonta/items/17531dde1e82d9786816
#
# osascript/tell application "Terminal":
# https://macscripter.net/viewtopic.php?pid=204122
# https://superuser.com/questions/1519128/how-do-i-target-and-close-a-specific-terminal-window-in-applescript
# https://superuser.com/questions/195633/applescript-to-open-a-new-terminal-window-in-current-space
# https://shade-search.com/sts/manage/developer/dev2/AppleScript%20Grammar.pdf
# https://stackoverflow.com/questions/27453987/how-to-close-a-terminal-tab-using-applescript
# https://gist.github.com/avillafiorita/9e626ce370e1da6c6373
# https://superuser.com/questions/1188772/mac-command-to-change-the-background-color-in-a-terminal



# Install ColorScheme for Terminal.app
PROFILE_NAME='Nord'
IMPORT_PROFILE_NAME="${PROFILE_NAME}.terminal"
COLOR_SCHEME_URL="https://raw.githubusercontent.com/arcticicestudio/nord-terminal-app/develop/src/xml/${IMPORT_PROFILE_NAME}"
COLORSCHEME_PATH="$HOME/.config/colorscheme"

# Download Profile
mkdir -p "${COLORSCHEME_PATH}"
curl -sL -o "${COLORSCHEME_PATH}/${IMPORT_PROFILE_NAME}" "${COLOR_SCHEME_URL}"

# TODO: open ... で、別 terminal が開いてうざいので、いったん手動にした。
# # Import Profile
# open "${COLORSCHEME_PATH}/${IMPORT_PROFILE_NAME}"
#
# # Settings Profile
# (
# cat <<EOT
# tell application "Terminal"
#     set themeName to "$PROFILE_NAME" 
#     set mainID to id of front window
#     set default settings to settings set themeName
#     set startup settings to settings set themeName
#     set current settings of window id mainID to settings set themeName
# --  close (every window whose id ≠ mainID)
# end tell
# EOT
# ) | osascript
#
# ## Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4
# ## Terminal > Profiles > Shell > When the shell exits: Close the window
# defaults write com.apple.Terminal shellExitAction -int 0

# [Mac のターミナルで日本語入力](https://sekika.github.io/2015/11/23/mac-terminal-japanese/)

