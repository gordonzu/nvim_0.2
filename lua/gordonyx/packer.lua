vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use({'wbthomason/packer.nvim'})
    use({'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}})
    use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }})
    use({'theprimeagen/harpoon'})
    use({'mbbill/undotree'})
    use({'tpope/vim-fugitive'})
    use({'lewis6991/gitsigns.nvim'})
    use({'cdelledonne/vim-cmake'})
    use({'marko-cerovac/material.nvim', as = 'material',})
    use({'fcpg/vim-orbital', as = 'orbital',})
    use({'rose-pine/neovim', as = 'rose-pine',})

    use({'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        }
    })

    use({'folke/neodev.nvim'})
    use({'mfussenegger/nvim-dap',
        config = function()
            require("gordonyx.remap").load_mappings("dap")
        end
    })

    use({'jay-babu/mason-nvim-dap.nvim',
        requires = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        }
    })

    use({'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
    })

    use({'numToStr/Comment.nvim',
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    })

    use({'VonHeikemen/lsp-zero.nvim',
	    branch = 'v1.x',
		requires = {
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
	    }
    })

    use({'nvimtools/none-ls.nvim',
            ft = {"python"},
            opts = function()
                return require "custom.configs.null-ls"
            end,
        })

end)

