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

  -- https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
    -- https://github.com/kylechui/nvim-surround?tab=readme-ov-file#rocket-usage
    -- Usage:
    -- ysiw) : surround_words => (surround_words)
    -- ys$" :  make strings => "make strings"
    -- * selected visualmode then <S-"> make strings => "make strings"
    -- ds] : [delete ar*ound me!] => delete around me!
    -- cs'" : 'change quot*es' => "change quotes"
    -- HTML/dst : remove <b>HTML t*ags</b> => remove HTML tagstack
    -- HTML/csth1<CR> : <b>or tag* types</b> => <h1>or tag types</h1>
  }
}
