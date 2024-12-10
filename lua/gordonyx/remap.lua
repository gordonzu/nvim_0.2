local builtin = require 'telescope.builtin'

vim.g.mapleader = " "
vim.keymap.set('n', "<F2>", vim.cmd.NvimTreeOpen)
vim.keymap.set('n', '<leader>pa', vim.cmd.PackerSync)
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

-- Telescope
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({
		find_command = { 'rg', '--files', '-g', '!.git', '--hidden' },});
end)
vim.keymap.set('n', '<leader>sp', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- nvim-dap
--[[ local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>bp"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>rr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue debugger",
        }
    }
}
return M ]]
