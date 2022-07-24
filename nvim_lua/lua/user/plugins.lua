local fn = vim.fn

-- Automatically install packer

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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
-- If somehow packer can't be loaded or not found, don't do anything with it. 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install my plugins here!
return packer.startup(function(use)
    
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API for nvim
    use "nvim-lua/plenary.nvim" -- Lua helper functions used by lots of plugins
    use "machakann/vim-sandwich"

    -- COLOR SCHEMES --
    use "rebelot/kanagawa.nvim"

    -- AUTOCOMPLETE --
    use "hrsh7th/nvim-cmp" -- The actual completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- SNIPPETS --
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- common snippet compilation

    -- LSP -- 
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" 

    -- Automatically setup configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
