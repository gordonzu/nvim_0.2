return {
    { "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {'lewis6991/gitsigns.nvim'},
    {'cdelledonne/vim-cmake'},
    {'nvim-tree/nvim-tree.lua', 
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {'numToStr/Comment.nvim',
        config = function(_, opts)
            require("Comment").setup(opts)
        end,
    },
    {'nvimtools/none-ls.nvim',
        ft = {"python"},
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
}

