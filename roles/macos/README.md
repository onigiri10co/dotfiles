# roles/macos
mocOS settings



## Dependencies
- nothing



## System Settings
### Desktop & Dock
- Dock > Size: 25%
- Dock > Magnification: Off
- Position on screen: Left
- Minimize window using: Genie Effect
- Double-click a window's title bar to: Zoom
- Automatically hide and show the Dock: true
- Animate opening applications: false
- Show indicators for open applications: false
- Show recent applications in Dock: false


### Keyboard
- Keyboard Shortcuts > Modifier Keys > Caps Lock key: ^Control
- Touch Bar Settings > Touch Bar shows: F1, F2, etc. Keys


### Siri & Spotlight
- Search results
  - Applications
  - Calculator
  - Folders
  - System Preferences



## Others
### .DS_Store ファイルを作らせない
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```



## References
- [macOSでの各種設定を自動化するdefaultsコマンド - memo.yammer.jp](https://memo.yammer.jp/posts/macos-defaults)

