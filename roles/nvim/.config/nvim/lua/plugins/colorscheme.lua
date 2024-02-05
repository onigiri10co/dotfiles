-- https://github.com/nordtheme/vim
return {
  "nordtheme/vim",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[colorscheme nord]])
  end,
}
