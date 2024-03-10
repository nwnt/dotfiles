local M = {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>cta", "<cmd>GoAlt<cr>", desc = "Go Test Alternate" },
  },
  config = function()
    require("go").setup({
      lsp_cfg = true,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

return M
