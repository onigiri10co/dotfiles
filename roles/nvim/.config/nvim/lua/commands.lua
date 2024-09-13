-- ref. https://neovim.io/doc/user/map.html#user-commands
-- Example
-- vim.api.nvim_create_user_command('OpenHoge', function(opts)
-- 	vim.cmd('e ' .. '~/hoge.md')
-- end, {})

-- Close vim with qa! command
vim.api.nvim_create_user_command('Q', function(opts)
  vim.cmd('qa!')
end, {})

-- Open the terminal in a split window at the bottom
vim.api.nvim_create_user_command('T', function(opts)
  vim.cmd('split | wincmd j | resize 20 | terminal')
end, {
  nargs = '*'
})
