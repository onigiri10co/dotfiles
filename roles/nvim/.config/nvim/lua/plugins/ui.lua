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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      -- https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/nord.lua
      -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#nord
      -- https://www.nordtheme.com/docs/colors-and-palettes
      local custom_theme = require('lualine.themes.nord')
      -- TODO: 何が作用しているか分からんが、そのまま Nord カラーを使うと、色がおかしくなるので一番マシなやつで仮置き
      local zantei_color = '#000000'
      custom_theme.normal.b.bg = zantei_color
      custom_theme.normal.c.bg = zantei_color
      custom_theme.inactive.b.bg = zantei_color
      custom_theme.inactive.c.bg = zantei_color
      require('lualine').setup {
        options = {
          theme = custom_theme,
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

  -- https://github.com/akinsho/toggleterm.nvim
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "T", "<cmd>TermExec cmd='tig status' direction=float<cr>", desc = "::Term tig" },
    },
    config = true,
  },

}
