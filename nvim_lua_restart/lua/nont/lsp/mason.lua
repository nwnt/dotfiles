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

mason.setup {}

-- setup 
mason_lsp.setup {
    ensure_installed = {
        'gopls',
        'lua-language-server',
    },
    automatic_installation = false,
}

mason_tool.setup {
    auto_update = false,
    run_on_start = true,
}

--  Capabilities 
--------------------------------
--------------------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local handlers = require("nont.lsp.handlers").handlers
--------------------------------
--------------------------------

mason_lsp.setup_handlers {
    ["sumneko_lua"] = function()
        local ok, ldev = pcall(require, "lua-dev")
        if not ok then
            return
        end

        local luadev = ldev.setup({
            lspconfig = {
                on_attach = handlers,
                capabilities = capabilities,
                -- August 31, 2022: Server Capabiltiies is wrong.  Look at the source's handlers.lua file
            },
        })

        local vim_config = {
            --on_attach = opts.on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        checkThirdParty = false,
                    },
                }
            },
        }
        local merged_config = vim.tbl_deep_extend("force", vim_config, luadev)
        lspconfig.sumneko_lua.setup(merged_config)
    end,
--    ["gopls"]
}
