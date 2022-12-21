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
        'sumneko_lua',
        'tsserver',
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
--local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end
--capabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = cmp_nvim_lsp.default_capabilities()

local handlers = require("lsp.handlers").handlers
--------------------------------
--------------------------------

mason_lsp.setup_handlers {
    ["sumneko_lua"] = function()
        local ok, ldev = pcall(require, "neodev")
        if not ok then
            return
        end

        ldev.setup({
            -- add any options here from neodev
        })

        local vim_config = {
            lspconfig = {
                on_attach = handlers,
                capabilities = capabilities,
            },
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
        lspconfig.sumneko_lua.setup(vim_config)
    end,
    ["gopls"] = function()
        lspconfig.gopls.setup {
            cmd = {"gopls"},
            filetypes = {"go", "gomod", "gowork", "gotmpl",},
            --root_dir = root_pattern("go.mod", ".git"),
            single_file_support = true,
            on_attach = handlers,
            capabilities = capabilities,
        }
    end,
}

lspconfig.tsserver.setup {}
