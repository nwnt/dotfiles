-- vim:foldmethod=marker:foldlevel=0:foldenable:
local fn = vim.fn

-- get_config util fn {{{
-- returns the require for use in 'config' parameter of packer's use
-- expects the name of the config file (under the folder)
-- source allaman/nvim
local function get_config(name)
    return string.format('require("plugconf/%s")', name)
end
--- }}}

-- Install Packer if not already being done so {{{
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
-- }}}

-- Reloads and packersync after saving this file {{{
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]
--- }}}

--- Packer Init {{{
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
--- }}}

packer.startup(function(use)

    use "wbthomason/packer.nvim"

    use "rebelot/kanagawa.nvim" -- colorscheme

    -- Fancier status line {{{
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    } -- }}}

    -- LSP related plugins {{{
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "whoissethdaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
        "rrethy/vim-illuminate", -- automatically highlight word under the cursor
        "smiteshp/nvim-navic",
        "j-hui/fidget.nvim"
    } -- }}}

    -- Auto Complete & Snippet sources (nvim-cmp){{{
    use {
        -- autocomplete --
        "hrsh7th/nvim-cmp", -- the actual completion plugin
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "hrsh7th/cmp-cmdline", -- cmdline completions
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",
        "lukas-reineke/cmp-rg",
        -- snippets --
        "l3mon4d3/luasnip", -- snippet engine
        "rafamadriz/friendly-snippets", -- common snippet compilation
        "folke/neodev.nvim",
        "onsails/lspkind.nvim",
    } -- }}}

-- Telescope {{{
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = fn.executable "make" == 1
    }
---}}}

    use({
        --- treesitter main
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = get_config("treesitter"),
    })

    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "tpope/vim-sleuth" -- Detect tabstop and shiftwidth automatically

    use{
        -- extra treesitter stuff
        "romgrk/nvim-treesitter-context",
        "nvim-treesitter/playground",
        "rrethy/nvim-treesitter-endwise",
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter"
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

    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }
    use {
        "numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
        config = function()
            require'Comment'.setup()
        end
    }

    use {
       "lukas-reineke/indent-blankline.nvim", -- Add indentation guides 
        config = function()
            require'indent_blankline'.setup {
                show_trailing_blankline_indent = false,
            }
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require'gitsigns'.setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            }
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
