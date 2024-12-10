vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use({'wbthomason/packer.nvim'})
    use({'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}})
    use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }})
    use({'theprimeagen/harpoon'})
    use({'mbbill/undotree'})
    use({'tpope/vim-fugitive'})
    use({'preservim/nerdtree'})
    use({'lewis6991/gitsigns.nvim'})

    use({'numToStr/Comment.nvim',
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    })

    use({'cdelledonne/vim-cmake'})

    use({'marko-cerovac/material.nvim', as = 'material',})
    use({'fcpg/vim-orbital', as = 'orbital',})
    use({'rose-pine/neovim', as = 'rose-pine',})

use({
	    'VonHeikemen/lsp-zero.nvim',
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

    use({
            'nvimtools/none-ls.nvim',
            ft = {"python"},
            opts = function()
                return require "custom.configs.null-ls"
            end,
        })

    end)

