return {
  {
    -- very simple vim plugin for easy resizing of your vim windows
    -- https://github.com/simeji/winresizer
    "simeji/winresizer",
  },

  -- https://github.com/smoka7/hop.nvim
  {
    "smoka7/hop.nvim",
    keys = {
      { "<leader>h", "<cmd>HopWord<cr>",    desc = "::Hop HopWord" },
      { "<leader>p", "<cmd>HopPattern<cr>", desc = "::Hop HopPattern" }
    },
    config = true
  },
}
