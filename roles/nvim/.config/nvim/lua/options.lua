-- ref. https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt
local api = vim.api

-- General
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.autochdir = true -- 開いたファイルの場所をカレントディレクトリにする
opt.swapfile = false -- swap ファイルを作成しない
opt.backup = false -- バックアップファイル出力無効
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- 保存されていないファイルを q するときに保存の確認を行う
opt.helplang = 'ja' -- Help に表示する言語

-- View
opt.number = true -- 行番号を表示する
api.nvim_win_set_option(0, 'signcolumn', 'yes:1') -- サインカラムを常に表示する

-- Edit
opt.expandtab = true -- true の場合、タブキー入力時にタブの代わりに半角スペースを入力する
opt.tabstop = 2 -- タブ幅を指定
opt.shiftwidth = 2 -- インデント入力時のタブ幅を指定（normal モード時の >>）
