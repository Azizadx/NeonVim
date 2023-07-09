--my color scheme
-- vim.cmd("colorscheme ")
-- Lua initialization file
local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
	print("Colorscheme not found!")
	return
end
