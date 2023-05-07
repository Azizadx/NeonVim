--my color scheme 
vim.cmd("colorscheme nightfly")
-- Lua initialization file
local status,_ = pcall(vim.cmd, "colorscheme nightfly")
if not status then 
  print("Colorscheme not found!")
  return
end

