-- require('nvim-treesitter').setup {
--     ensure_installed = { "help", "python", "lua", "markdown", "latex", "json", "typst" },
--
--     sync_install = false, 
--
--     auto_install = true,
--
--     highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--     },
-- }


require'nvim-treesitter'.install { 'lua', 'markdown', 'latex', 'typst' }
