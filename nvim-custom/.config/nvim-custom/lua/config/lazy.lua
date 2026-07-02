-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{
			"nvim-telescope/telescope.nvim",
			version = "*",
			dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
		},
		{ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate" },
		{
			"folke/tokyonight.nvim",
			config = function()
				vim.cmd.colorscheme("tokyonight")
			end,
		},
		-- {
		-- 	"rose-pine/neovim",
		-- 	config = function()
		-- 		vim.cmd.colorscheme("rose-pine-moon")
		-- 	end,
		-- },
		{
		    "ThePrimeagen/harpoon",
		    branch = "harpoon2",
		    dependencies = { "nvim-lua/plenary.nvim" }
		},
		{ "mbbill/undotree" },

		-- { import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "tokyonight" } },
	-- automatically check for plugin updates
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
})
