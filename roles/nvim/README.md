# roles/nvim
neovim/neovim: Vim-fork focused on extensibility and usability



## Dependencies
- homebrew



## Usage
- `nvim` コマンドで起動できる。alias vim=nvim を設定してある。unset vim すれば、素の vim が使用できる。
- 起動時に `$XDG_CONFIG_HOME/init.lua` を読み込んで起動し、自動的にセットアップする。
- `<leader>k` でキーマップ一覧を参照できる。`[MS]` という文字列で独自定義したマップを参照できる。
  - ※ keymap.lua 内で定義: leader=space, localleader=,(comma)



## Plugins
プラグインマネージャーは、lazy.nivm を使用しており、その仕様に基づいて個々のプラグインを以下の方針で管理する。

- vim 上では、`:Lazy` コマンドでコンソールを開ける。そのまま `(U)` キー押下でプラグインアップデート可能。
- plugins ディレクトリ配下にプラグイン毎の設定ファイル（.lua）を作成する。
- 設定方法は、[folke/lazy.nvim > Plugin Spec](htps://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec) を参照する。
- 一時不要になったプラグインは、 disabled ディレクトリ配下に移す（再び元に戻せば、有効化できる）。
  - または、[enabled=false](https://www.lazyvim.org/configuration/plugins#-disabling-plugins) で無効化することもできる。
- 完全に不要になれば、ファイルごと削除する。
- ただし、まとめて管理したほうが分かりやすいプラグインに関しては、一つにまとめることもある（例: LSP）。


### Installed plugins
- See: [Vim Settings · onigomex/dotfiles Wiki](https://github.com/onigomex/dotfiles/wiki/Vim-Settings)



## Tree
- init.lua
- lua/
  - plugins/
  - autocmds.lua: 自動コマンドを定義する（例: ファイル保存時に自動で末尾の空白を除去）
  - commands.lua: 独自コマンドを定義する
  - keymaps.lua: リーダーキーやキーマップを定義する
  - options.lua: nvim の基本オプションを定義する（例: swap ファイルを作成しない）
  - plugin.lua: プラグインマネージャー（Lazy.nvim）のセットアップ



## References
- [neovim/neovim: Vim-fork focused on extensibility and usability](https://github.com/neovim/neovim)
- [General Settings | LazyVim](https://www.lazyvim.org/configuration/general)

