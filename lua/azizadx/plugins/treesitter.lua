local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
   -- enable synatx highlighting 
    highlight = {
      enable = true
    },
  -- enable indentation 
    indent = {enable = true},
  -- enable autotagging (with nvim-ts-autotag plugin)
    autotage = { enable = true},
    ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    },

  -- auto install above language parsers 
  auto_install = true,

})
