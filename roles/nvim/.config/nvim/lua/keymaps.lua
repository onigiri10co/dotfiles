-- ref. https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local augroup = vim.api.nvim_create_augroup -- Create/get sutocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Leader
vim.g.mapleader = " " -- <leader> = space
vim.g.maplocalleader = "," -- <localLeader>

-- Search
vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>', { desc = '::Keymap [non]hlsearch', silent = true })

-- Close Window
local close_window = function()
  vim.keymap.set('n', '<leader><leader>', '<cmd>bd<cr>', { buffer = true, silent = true })
end
autocmd("FileType", {
  desc = 'Close "Help" window if you press <leader><leader>',
  group = augroup('Help', { clear = true }),
  pattern = 'help',
  callback = close_window,
})
autocmd('FileType', {
  desc = 'Close "QuickFix" window if you press <leader><leader>',
  group = augroup('QuickFix', { clear = true }),
  pattern = 'qf',
  callback = close_window,
})

-- Terminal
-- https://qiita.com/delphinus/items/aea16e82de2145d2a6b7
vim.keymap.set('t', '<esc>', '<c-\\><c-n>', { desc = '::Keymap Change Terminal-Normal mode by <esc> from Terminal-Job mode. Note: "t" is :tnoremap (Terminal-Job mode)' })
