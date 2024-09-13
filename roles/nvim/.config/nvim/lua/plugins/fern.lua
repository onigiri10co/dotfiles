return {
  -- https://github.com/lambdalisue/fern.vim
  {
    "lambdalisue/fern.vim",
    keys = {
      { "<leader>e", "<cmd>Fern .<cr>", desc = "::Fern explorer" }
    },
    config = function()
      vim.g["fern#default_hidden"] = 1
      local augroup = vim.api.nvim_create_augroup -- Create/get sutocommand group
      local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
      local fern_keymap = function()
        vim.keymap.set('n', '<leader><leader>', '<cmd>bd<cr>', { buffer = true, silent = true })
      end
      autocmd("FileType", {
        group = augroup('Fern', { clear = true }),
        pattern = 'fern',
        callback = fern_keymap,
      })
    end,
  },

  -- https://github.com/lambdalisue/vim-fern-hijack
  {
    "lambdalisue/vim-fern-hijack",
    dependencies = { "lambdalisue/fern.vim" },
  },
}
