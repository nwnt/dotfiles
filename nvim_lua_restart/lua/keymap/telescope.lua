local b = require("keymap.binding")
local tel = require("telescope.builtin")
local nnoremap = b.nnoremap

local function project_search()
    tel.grep_string( {
            search = vim.fn.input({
                prompt = "Grep > "
            })
        }
    )
end

nnoremap("<leader>ff", tel.find_files)
nnoremap("<leader>fg",  "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb",  "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fh",  "<cmd>Telescope help_tags<CR>")
nnoremap("<leader>ps", project_search)
