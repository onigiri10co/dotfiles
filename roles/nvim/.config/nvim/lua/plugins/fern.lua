return {
  -- https://github.com/lambdalisue/fern.vim
  {
    "lambdalisue/fern.vim",
    keys = {
      { "<leader>e", "<cmd>Fern .<cr>", desc = "[MS] explorer: Fern ." }
    },
    config = function()
      vim.g["fern#default_hidden"] = 1
    end,
  },

  -- https://github.com/lambdalisue/vim-fern-hijack
  {
    "lambdalisue/vim-fern-hijack",
    dependencies = { "lambdalisue/fern.vim" },
  },
}
