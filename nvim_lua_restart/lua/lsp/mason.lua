-- vim:foldmethod=marker:foldlevel=0

-- importings {{{
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    print "mason not ok"
    return
end

local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
    print "mason lsp not ok"
    return
end


local mason_tool_ok, mason_tool = pcall(require, "mason-tool-installer")
if not mason_tool_ok then
    print "mason tool installer not ok"
    return
end

local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
    return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

local fidget_ok, fidget = pcall(require, "fidget")
if not fidget_ok then
    return 
end
-- }}}

-- Enable the following language servers
-- Add any additional override configs in the following tables.  They will 
-- passed to the settings field of the server config.

fidget.setup()

local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false},
            telemetry = { enable = false},
        },
    },
    tsserver = {},
    gopls = {}
}

-- setup 
mason.setup {}

mason_lsp.setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
}

mason_tool.setup {
    auto_update = false,
    run_on_start = true,
}

-- neodev (lua for vim config) setup {{{
local ok, ldev = pcall(require, "neodev")
if not ok then
    return
end

ldev.setup({
    -- add any options here from neodev
})
-- }}}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local handlers = require("lsp.handlers").handlers

mason_lsp.setup_handlers {
    function(server_name)
        lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = handlers,
            settings = servers[server_name],
        }
    end,
}

