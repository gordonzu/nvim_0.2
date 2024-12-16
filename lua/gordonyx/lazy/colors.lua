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

return 
{
    {
        "marko-cerovac/material.nvim",
        name = "material",
        lazy = false,

        config = function()
            require("material").setup({
            
            })
            MyColor();
        end
    },
}


