local builtin = require 'telescope.builtin'
local dap, dapui = require("dap"), require("dapui")

vim.g.mapleader = " "
vim.keymap.set('n', "<F2>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "C-f", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
--vim.keymap.set("n", "<leader>t", vim.command.hsplit)


