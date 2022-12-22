local M = {}

--[[ These functions are used by the handler (to be used by lspconfig on_attach
--
--]]

local function lsp_keymaps(bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true, buffer = bufnr, }
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  --vim.keymap.set("n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]] -- Define the Format function
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>gf", "<cmd>Format<CR>", opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>cd", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
end

local function attach_navic(client, bufnr)
    vim.g.navic_silence = true
    local status_ok, navic = pcall(require, "nvim-navic")
    if not status_ok then
        return
    end
    navic.attach(client, bufnr)
end

M.handlers = function(client, bufnr)
    lsp_keymaps(bufnr)
    attach_navic(client, bufnr)

    --[[
    if client.name == "jdt.ls" then
        vim.lsp.codelens.refresh()
        if JAVA_DAP_ACTIVE then
            require("jdtls")setup_dap { hotcodereplace = "auto" }
            require("jdtls.dap").setup_dap_main_class_configs()
        end
    end
    --]]
end


function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false }) 
    augroup end
  ]]
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]]

return M
