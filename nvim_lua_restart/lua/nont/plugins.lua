local fn = vim.fn

-- Install Packer if not already being done so
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Reloads and packersync after saving this file

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local loaded, packer = pcall(require, "packer")
if not loaded then
    print "Packer is not installed"
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

    use "wbthomason/packer.nvim"

    use "rebelot/kanagawa.nvim"

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
        "RRethy/vim-illuminate", -- Automatically highlight word under the cursor
        "SmiteshP/nvim-navic"
    }

    use {
        -- AUTOCOMPLETE --
        "hrsh7th/nvim-cmp", -- The actual completion plugin
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "hrsh7th/cmp-cmdline", -- cmdline completions
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",
        -- SNIPPETS --
        "L3MON4D3/LuaSnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- common snippet compilation
        "folke/lua-dev.nvim"
    }

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
