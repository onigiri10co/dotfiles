return {
  -- https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "T", "<cmd>TermExec cmd='tig status' direction=float<cr>", desc = "::Term tig" },
    },
    config = true,
  },
}
