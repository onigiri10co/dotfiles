-- https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icon support
  keys = {
    { "<leader>k", "<cmd>FzfLua keymaps<cr>", desc = "[MS] keymaps" },
    { "<leader>l", "<cmd>FzfLua files<cr>", desc = "[MS] list files in current dir" },
    { "<leader>f", "<cmd>FzfLua blines<cr>", desc = "[MS] find in this file" },
    { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "[MS] buffers files" },
    { "<leader>c", "<cmd>FzfLua registers<cr>", desc = "[MS] clipboard" },
    { "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "[MS] grep" },
    { "<localLeader>gl", "<cmd>FzfLua git_files<cr>", desc = "[MS] list files in git repo" },
    { "<localLeader>gb", "<cmd>FzfLua git_branches<cr>", desc = "[MS] git branches" },
    { "<localLeader>gc", "<cmd>FzfLua git_commits<cr>", desc = "[MS] git commit log in current repo" },
    { "<localLeader>gcc", "<cmd>FzfLua git_bcommits<cr>", desc = "[MS] git commit log in current file" },
  },
  config = function()
    require("fzf-lua").setup({})
  end,
}
