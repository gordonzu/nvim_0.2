return {    
    'folke/neodev.nvim',
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'mfussenegger/nvim-dap',
    },
    'rcarriga/nvim-dap-ui',
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

        vim.keymap.set("n", "<leader>dt", dapui.toggle, {noremap = true})
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {noremap = true})
        vim.keymap.set("n", "<leader>dl", dap.run_last, {noremap = true})
        vim.keymap.set("n", "<leader>dr", dapui.open({reset = true}), {noremap = true})
    end
}
