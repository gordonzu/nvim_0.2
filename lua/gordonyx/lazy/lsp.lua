return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        --{'folke/neodev.nvim'},

        -- Autocompletion
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"saadparwaiz1/cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-nvim-lua"},

        -- Snippets
        {"L3MON4D3/LuaSnip"},
        {"rafamadriz/friendly-snippets"},
    },

    config = function()

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
    end
}

