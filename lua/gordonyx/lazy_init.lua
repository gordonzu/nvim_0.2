local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup({

    {'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim'},
    {'nvim-treesitter/nvim-treesitter'},
    {'theprimeagen/harpoon'},
    {'mbbill/undotree'},
    {'tpope/vim-fugitive'},
    {'lewis6991/gitsigns.nvim'},
    {'cdelledonne/vim-cmake'},
    {'marko-cerovac/material.nvim'},
    {'fcpg/vim-orbital'},
    {'rose-pine/neovim'},
    {'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons'},
    --{'vhyrro/luarocks.nvim, priority = 1000, config = true'},

    -- Debugging ---------------------------------
    {'folke/neodev.nvim'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'mfussenegger/nvim-dap'},

    {'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
    },

    {'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },

    --require('dapui').setup({})

    -------------------------------------------------

    {'numToStr/Comment.nvim',
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },

    {'VonHeikemen/lsp-zero.nvim',
	    branch = 'v1.x',
		dependencies = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},
		    {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            --{'folke/neodev.nvim'},

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},
		    {'hrsh7th/cmp-buffer'},
		    {'hrsh7th/cmp-path'},
		    {'saadparwaiz1/cmp_luasnip'},
		    {'hrsh7th/cmp-nvim-lsp'},
		    {'hrsh7th/cmp-nvim-lua'},

		    -- Snippets
		    {'L3MON4D3/LuaSnip'},
		    {'rafamadriz/friendly-snippets'},
	    },
    },

    {'nvimtools/none-ls.nvim',
            ft = {"python"},
            opts = function()
                return require "custom.configs.null-ls"
            end,
        },

    })
