-- ref. https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Leader
vim.g.mapleader = " " -- <leader> = space
vim.g.maplocalleader = "," -- <localLeader>

-- Search
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR>', { silent = true })
