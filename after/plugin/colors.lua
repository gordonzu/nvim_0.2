require('material').setup({

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

    plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
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
        -- "nvim-tree",
        -- "nvim-web-devicons",
        -- "sneak",
        "telescope",
        -- "trouble",
        -- "which-key",
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

    custom_highlights = {}
})



function MyColor(color)
    --color = color or "tokyonight-night"
	color = color or "material"
	--color = color or "orbital"
	--color = color or "afterglow"
	--color = color or "apprentice"
	--color = color or "cake16"
	--color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

MyColor()

