-- https://github.com/lambdalisue/fern.vim
return {
  "lambdalisue/fern.vim",
  keys = {
    { "<leader>e", "<cmd>Fern .<cr>", desc = "[MS] explorer: Fern ." }
  },
  config = function()
    vim.g["fern#default_hidden"] = 1
  end,
}
