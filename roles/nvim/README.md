# roles/nvim
neovim/neovim: Vim-fork focused on extensibility and usability



## Dependencies
- homebrew



## Usage
- `nvim` で起動できる（alias vim=nvim を設定している）。
- 起動時に、`$XDG_CONFIG_HOME/init.lua` を読み込んで起動する。



## plugins
プラグインマネージャーは、lazy.nivm を使用しており、その仕様に基づいて個々のプラグインを以下の方針で管理する。

- plugins ディレクトリ配下にプラグイン毎の設定ファイル（.lua）を作成する。
- 一時不要になったプラグインは、 disabled ディレクトリ配下に移す（再び元に戻せば、有効化できる）。
- 完全に不要になれば、ファイルごと削除する。
- ただし、まとめて管理したほうが分かりやすいプラグインに関しては、一つにまとめることもある（例: LSP）。



## References
- [neovim/neovim: Vim-fork focused on extensibility and usability](https://github.com/neovim/neovim)

