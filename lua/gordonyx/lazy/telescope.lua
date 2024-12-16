return {
    'nvim-telescope/telescope.nvim', 
    tag = "0.1.5",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },

    config = function()
        require("telescope").setup({})
        local builtin = require("telescope.builtin")
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
    end
}
