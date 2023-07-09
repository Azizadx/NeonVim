local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	--list all plugins am using now

	-- packer so that it can manage itself
	use("wbthomason/packer.nvim")
	-- mightnigth theme
	use("dasupradyumna/midnight.nvim")
	-- draula theme
	use("Mofiqul/dracula.nvim")
	-- Languages
	--
	-- zig
	use("ziglang/zig.vim")

	-- rust
	use("simrat39/rust-tools.nvim")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")

	--color scheme
	use("bluz71/vim-nightfly-guicolors")
	-- trying the transparte
	use("xiyaowong/transparent.nvim")
	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- maximizes and restores current window
	use("szw/vim-maximizer")

	-- essentail plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	--commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	-- synatx highlighting and Autoclosing
	use("nvim-treesitter/nvim-treesitter")
	--auto closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
	-- Vimwiki
	use("vimwiki/vimwiki")
	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_boostrap then
		require("packer").sync()
	end
end)
