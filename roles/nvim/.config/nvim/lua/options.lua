-- ref. https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

-- General
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.autochdir = true -- 開いたファイルの場所をカレントディレクトリにする
opt.swapfile = fals -- swap ファイルを作成しない
opt.backup = false -- バックアップファイル出力無効
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true -- 保存されていないファイルを q するときに保存の確認を行う

-- View
opt.number = true -- 行番号を表示
