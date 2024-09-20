-- ref. https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ref. https://github.com/folke/lazy.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
local config = {
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = true, -- プラグインのアップデートを自動的にチェック
  },
  change_detection = {
    notify = false, -- https://github.com/folke/lazy.nvim/issues/32#issuecomment-1443733721
  },
  ui = {
    border = 'single'
  }
}

require("lazy").setup(config)
