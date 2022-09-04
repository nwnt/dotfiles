local color = "kanagawa"

local ok, _ = pcall(vim.cmd, "colorscheme " .. color)
if not ok then
  vim.notify("colorscheme " .. color .. " not found!")
  return 
end
