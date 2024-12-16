require("gordonyx.set")
require("gordonyx.remap")
require("gordonyx.lazy_init")

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    callback = function(e)
        local opts = {buffer = e.buf}
        vim.keymap.set("n", "<leader>b", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
        --vim.keymap.set("n", "gw", function() vim.lsp.buf.document_symbol() end)
        vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol() end)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
        vim.keymap.set("n", "<leader>af", function() vim.lsp.buf.code_action() end)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
    end
})


