-- if lspconfig is not there, don't do anything further
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "lsp.mason"
require "lsp.config".setup()
