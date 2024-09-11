-- https://github.com/nordtheme/vim
return {
  "nordtheme/vim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local augroup = vim.api.nvim_create_augroup -- Create/get sutocommand group
    local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
    -- https://www.nordtheme.com/docs/ports/vim/configuration
    vim.g.nord_uniform_diff_background = 1
    -- https://www.kengotakimoto.com/posts/read_help_to_highlight_vim_cursorline
    local group = augroup('ColorschemeNord', { clear = true })
    autocmd("ColorScheme", {
      group = group,
      pattern = 'nord',
      command = 'highlight Visual ctermfg=11'
    })
    -- ""NOTE: Set at the bottom of the color sheme
    vim.cmd([[colorscheme nord]])
  end,
}
