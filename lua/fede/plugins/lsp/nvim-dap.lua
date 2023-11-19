return {
    "mfussenegger/nvim-dap",
    config = function()
        local keymap = vim.keymap.set
        keymap({ "n", "v", }, "<leader>db", "<cmd>DapToggleBreakpoint <CR>")
        keymap( "n", "<leader>dus", 
            function()
                local widgets = require("dap.ui.widgets");
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end)
    end,
}
