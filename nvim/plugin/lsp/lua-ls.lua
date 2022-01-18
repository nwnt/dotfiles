-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
MAIN = vim.fn.expand('$LUA_LSP_MAIN')
BIN = vim.fn.expand('$LUA_LSP_BIN')

require'lspconfig'.sumneko_lua.setup {
    cmd = { BIN, "-E", MAIN },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}
