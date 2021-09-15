lua <<EOF
require'nvim-treesitter.configs'.setup {

    ensure_isntall = "all", 

    incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
        },
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true
    },

}
EOF
