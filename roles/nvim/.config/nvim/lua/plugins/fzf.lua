-- https://github.com/ibhagwan/fzf-lua
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icon support
  keys = {
    { "<leader>k",        "<cmd>FzfLua keymaps<cr>",                    desc = "::fzf keymaps" },
    { "<leader>l",        "<cmd>FzfLua files<cr>",                      desc = "::fzf list files in current dir" },
    { "<leader>f",        "<cmd>FzfLua blines<cr>",                     desc = "::fzf find in this file" },
    { "<leader>b",        "<cmd>FzfLua buffers<cr>",                    desc = "::fzf buffers files" },
    { "<leader>c",        "<cmd>FzfLua registers<cr>",                  desc = "::fzf clipboard" },
    { "<leader>g",        "<cmd>FzfLua live_grep<cr>",                  desc = "::fzf grep" },
    { "go",               "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "::fzf list document symbols" },
    { "gO",               "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "::fzf list workspace symbols" },
    { "<localLeader>gl",  "<cmd>FzfLua git_files<cr>",                  desc = "::git list files in git repo" },
    { "<localLeader>gb",  "<cmd>FzfLua git_branches<cr>",               desc = "::git branches" },
    { "<localLeader>gc",  "<cmd>FzfLua git_commits<cr>",                desc = "::git commit log in current repo" },
    { "<localLeader>gcc", "<cmd>FzfLua git_bcommits<cr>",               desc = "::git commit log in current file" },
  },
  config = function()
    require("fzf-lua").setup({})
  end,
}
