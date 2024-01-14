#!/usr/bin/env zsh
set -e

# Install ColorScheme for Terminal.app
PROFILE_NAME='Nord'
IMPORT_PROFILE_NAME="${PROFILE_NAME}.terminal"
COLOR_SCHEME_URL="https://raw.githubusercontent.com/arcticicestudio/nord-terminal-app/develop/src/xml/${IMPORT_PROFILE_NAME}"
COLORSCHEME_PATH="$HOME/.config/colorscheme"

# Download Profile
mkdir -p "${COLORSCHEME_PATH}"
curl -sL -o "${COLORSCHEME_PATH}/${IMPORT_PROFILE_NAME}" "${COLOR_SCHEME_URL}"

# Import Profile
open "${COLORSCHEME_PATH}/${IMPORT_PROFILE_NAME}"

# Settings
## Theme: Nord
defaults write com.apple.Terminal "Default Window Settings" -string "Nord"
defaults write com.apple.Terminal "Startup Window Settings" -string "Nord"
## Shell > When the shell exits: Close the window
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Nord:shellExitAction integer 0" ~/Library/Preferences/com.apple.Terminal.plist
## Advanced > Bell: OFF
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Nord:Bell bool false" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Nord:VisualBell bool false" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Nord:BellBadge bool false" ~/Library/Preferences/com.apple.Terminal.plist
/usr/libexec/PlistBuddy -c "Add 'Window Settings':Nord:BellBounce bool false" ~/Library/Preferences/com.apple.Terminal.plist

