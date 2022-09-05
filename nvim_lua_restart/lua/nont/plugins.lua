local fn = vim.fn

-- returns the require for use in 'config' parameter of packer's use
-- expects the name of the config file (under the folder)
local function get_config(name)
    return string.format('require("plugconf/%s")', name)
end

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
    print "Instaling packer close and reopen Neovim..."
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
        "whoissethdaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
        "rrethy/vim-illuminate", -- automatically highlight word under the cursor
        "smiteshp/nvim-navic"
    }

    use {
        -- autocomplete --
        "hrsh7th/nvim-cmp", -- the actual completion plugin
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "hrsh7th/cmp-cmdline", -- cmdline completions
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",
        -- snippets --
        "l3mon4d3/luasnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- common snippet compilation
        "folke/lua-dev.nvim"
    }

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use({
        --- treesitter main
        "nvim-treesitter/nvim-treesitter",
        run = ":tsupdate",
        config = get_config("treesitter"),
    })


    use{
        -- extra treesitter stuff
        "romgrk/nvim-treesitter-context",
        "nvim-treesitter/playground",
        "rrethy/nvim-treesitter-endwise",
    }

    use({ "windwp/nvim-autopairs", config = get_config("nvim-autopairs") })
    use({ "echasnovski/mini.nvim", branch = "stable", config = get_config("mini") })
    use({ "folke/which-key.nvim", config = get_config("which-key") })

    use({ "ray-x/go.nvim", requires = "ray-x/guihua.lua", config = get_config("go"), ft = { "go" } })

    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        "s1n7ax/nvim-window-picker",
        config = get_config("nvim-window-picker"),
      },
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = get_config("neotree"),
  })


    -- automatically set up your configuration after cloning packer.nvim
    -- put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
