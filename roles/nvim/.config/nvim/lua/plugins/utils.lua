return {
  -- https://github.com/echasnovski/mini.splitjoin
  {
    "echasnovski/mini.splitjoin",
    -- https://github.com/echasnovski/mini.splitjoin?tab=readme-ov-file#default-config
    config = function()
      require("mini.splitjoin").setup {
        mappings = {
          toggle = 'gJ',
          split = '',
          join = '',
        },
      }
    end
  },

}
