local lsp = require('lsp-zero')
local capabilities = lsp.capabilities
local on_attach = lsp.on_attach

vim.g.mapleader = ' '

lsp.preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.ensure_installed({
    'lua_ls',
    "pyright",
    "pylsp",
    "cmake",
    "clangd",
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = true,
    	setup_servers_on_start = true,
	sign_icons = { }
})

--[[ lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
-- diagnostics
vim.keymap.set("n", "<leader>b", function() vim.diagnostic.open_float() end)
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

end) ]]

local servers = {
    'lua_ls',
    'pyright',
    'pylsp',
    'cmake',
    'clangd',
}

require'lspconfig'.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
                globals = {  "vim" },
            }
        }
    }
}

require('lspconfig').pylsp.setup({
    cmd = { "pylsp" },
    filetypes = { "python" },
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },

                pylint = { enabled = true, executable = "pylint" },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },

                pylsp_mypy = { enabled = true },
            },
        }

    }
})

require'lspconfig'.pyright.setup{
    on_attch = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
        pyright = {
           disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" }
            },
        },
    },
}

require('lspconfig').clangd.setup({
     single_file_support = true,
     on_attach = function(client, bufnr)
         client.server_capabilities.signatureHelpProvider = false
         on_attach(client, bufnr)
     end,
     capabilities = capabilities,
})

--require'lspconfig'.Comment.setup{}

--[[require('lspconfig').cmake.setup({
    single_file_support = false,
    on_attach = function(client, bufnr)
        print('hello cmake')
    end
})
--]]

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})


