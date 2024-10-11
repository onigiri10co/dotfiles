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
  },

  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    config = true
  },

  -- https://github.com/nvim-lualine/lualine.nvim
  -- TODO: ステータスラインを上部にしたい（tabline を使えばできそう）, ref: https://www.reddit.com/r/neovim/comments/18nj7xr/lualine_is_always_at_the_top_how_to_get_it_to_the/
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        }
      }
    end
  },

  -- https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- https://github.com/echasnovski/mini.indentscope
  {
    "echasnovski/mini.indentscope",
    config = true
  },

  -- TODO: 本当はこれを使いたいが、chunk が、まともに動かないので、mini.indentscope で賄っている。
  -- -- https://github.com/shellRaining/hlchunk.nvim
  -- {
  --   "shellRaining/hlchunk.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("hlchunk").setup({
  --       chunk = { enable = false, },
  --       indent = { enable = true },
  --       line_num = { enable = false },
  --       blank = { enable = false }
  --     })
  --   end
  -- },

  -- https://github.com/b0o/incline.nvim
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
      require('incline').setup()
    end,
  },

}
