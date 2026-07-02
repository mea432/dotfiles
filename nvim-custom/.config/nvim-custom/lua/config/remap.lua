vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks of text with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { noremap = true, silent = true })

-- Stay in same location when J-ing
vim.keymap.set("n", "J", "mzJ`z")

-- Paste without changing register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Delete without changing register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Yank easier into system keyboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- I use <C-c> to escape insert mode and stuff. This is for vertical inserts
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
