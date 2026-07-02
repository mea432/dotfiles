-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable mouse
-- vim.opt.mouse = ""
-- vim.opt.mousescroll = "ver:0,hor:0"

-- Disable cursor line since it blocks the background
vim.opt.cursorline = false

-- Enable spell check
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#0f202e", bg = "NONE" })
