function MyColor(color)
	color = color or "material"
    --color = color or "tokyonight-night"
	--color = color or "orbital"
	--color = color or "afterglow"
	--color = color or "apprentice"
	--color = color or "cake16"
	--color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return 
{
    {
        "marko-cerovac/material.nvim",
        name = "material",
        lazy = false,

        config = function()
            require("material").setup({
                contrast = {
                    terminal = true,
                    sidebars = true,
                    floating_windows = true,
                    cursor_line = false,
                    non_current_windows = true,
                    filetypes = {},
                },
                styles = { 
                    comments = { italic = true },
                    strings = {},
                    keywords = { underline = true },
                    functions = { italic = true },
                    variables = {},
                    operators = {},
                    types = {},
                },
                plugins = { 
                    "dap",
                    -- "dashboard",
                    "gitsigns",
                    -- "hop",
                    -- "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "neorg",
                    "nvim-cmp",
                    -- "nvim-navic",
                    "nvim-tree",
                    "nvim-web-devicons",
                    -- "sneak",
                    "telescope",
                    -- "trouble",
                    "which-key",
                },
                disable = {
                    colored_cursor = false,
                    borders = true,
                    background = false,
            term_colors = false,
                    eob_lines = false
                },
                high_visibility = {
                    lighter = false,
                    darker = false
                },
                lualine_style = "default",
                async_loading = true,
                custom_colors = nil,
                custom_highlights = {},

            })

            vim.keymap.set("n", "<leader>z", function()
                require("material.functions").find_style()
            end)

            MyColor();
        end
    },

    "fcpg/vim-orbital", name = "orbital",
    "rose-pine/neovim", name = "rose-pine",
    "projekt0n/github-nvim-theme", name = "github",
    "folke/tokyonight.nvim", name = "tokyonight",
    "catppuccin/nvim", name = "catppuccin",
    "junegunn/seoul256.vim", name = "seoul256",
    "zefei/cake16", name = "cake16",
    "water-sucks/darkrose.nvim", name = "darkrose",
    "aktersnurra/no-clown-fiesta.nvim", name = "no-clown-fiesta",
    "lvim-tech/lvim-colorscheme", name = "lvim-colorscheme",
    "doums/darcula", name = "darcula",
    "nordtheme/vim", name = "nord",
}


