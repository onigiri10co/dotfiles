# roles/macos
mocOS settings



## Dependencies
- nothing



## System Settings
※チェック済 = install.sh 内にコード化済


### Desktop & Dock
- [x] Dock > Size: 35
- [x] Dock > Magnification: Off
- [x] Position on screen: Left
- [x] Minimize window using: Genie Effect
- [x] Double-click a window's title bar to: Zoom
- [x] Automatically hide and show the Dock: true
- [x] Animate opening applications: false
- [x] Show indicators for open applications: false
- [x] Show recent applications in Dock: false
- [x] Dock から全てのアプリを削除（ゴミ箱だけにする）※以後は、起動中のアプリだけが Dock に表示される。


### Keyboard
- Keyboard Shortcuts:
  - [x] Modifier Keys > Caps Lock key: ^Control
  - [x] Function Keys > Use F1,F2, etc. kyes as standard function keys: true
- [ ] Touch Bar Settings > Touch Bar shows: F1, F2, etc. Keys


### Siri & Spotlight
- [ ] Search results
  - Applications
  - Calculator
  - Folders
  - System Settings



## Desktop > Show View Options
- [x] Sort By: Name
- [x] Icon size: 20 x 20
- [x] Grid spacing: max(=100)
- [x] Text size: 10
- [x] Label position: Right



## Finder
- [x] View > as List
- [x] View > Show Path Bar
- [x] View > Show Preview
- [x] サイドバーのタグを非表示
- [x] すべての拡張子を表示
- [x] 隠しファイル・フォルダを表示
- [x] ゴミ箱を空にするときの警告無効化
- [x] パスバーを HOME から表示
- [x] カレントディレクトリ内を検索
- [x] 拡張子変更時の警告を無視


## Screen Shot
- [x] スクリーンショット保存先を変更
- [x] スクリーンショット名を日付だけにする



## Feedback
- [x] クラッシュレポートを無効化する
- [x] フィードバックを送信しない



## Terminal
※出力されたコマンドを手動で流して設定する（プロファイルを open するとプロセスが移行してしまうため）。


### Profile
- [x] Startup: Nord
- [x] Default: Nord


### Shell
- [x] When the shell exits: Close the window


### Advanced
- [x] Bell: OFF



## Others
- [x] .DS_Store ファイルを作らせない（USB・ネットワークドライブ）
- [x] 自動で頭文字を大文字にしない



## Tips
### 設定を参照する
```
# e.g., Finder
% defaults read com.apple.finder
```


### 設定をリセットする
```
# e.g., Finder
% rm ~/Library/Preferences/com.apple.finder.plist
% killall Finder
```



## References
- [macOSでの各種設定を自動化するdefaultsコマンド - memo.yammer.jp](https://memo.yammer.jp/posts/macos-defaults)
- [MacOS　PlistBuddyコマンドを使ってplistファイルを自由に編集しよう #MacOSX - Qiita](https://qiita.com/keitean/items/6972b8f34636a88bae74)
- [初めての Apple Script #AppleScript - Qiita](https://qiita.com/satosystems/items/8fff5b2313ecd6f81af3)
- [コマンドラインから macOS をコントロールする - talkabout](https://talkabout.jp/smarthome/macos-teminal.html)
- [osascriptでOS Xのアプリを操作する - Bye Bye Moore](https://shuzo-kino.hateblo.jp/entry/2015/01/03/234722)
- [Apple Script で CLI を作るための要点](https://zenn.dev/suzuki_hoge/articles/2020-12-apple-script-984ae31d9a473ca1ffb2)
- [macOS defaults list](https://macos-defaults.com/)
- [Mac ターミナル defaults コマンドの使い方](https://www.webdesignleaves.com/pr/plugins/mac_terminal_basics_06.html)
- [1からMacの開発環境を構築する](https://zenn.dev/horatjp/articles/macos-dev-env)
- [Macの設定の半自動化方法 #Mac - Qiita](https://qiita.com/DiveMasakazu/items/ac4c6daad50084656758)
- [What is PlistBuddy?. PlistBuddy is mac build-in program… | by Mark | Medium](https://medium.com/@marksiu/what-is-plistbuddy-76cb4f0c262d)
- [システム環境設定の表示操作：Macはからだの一部です。：SSブログ](https://start-mac.blog.ss-blog.jp/2020-08-04)
- [dotfiles/.macos at master · cbracco/dotfiles](https://github.com/cbracco/dotfiles/blob/master/.macos)

