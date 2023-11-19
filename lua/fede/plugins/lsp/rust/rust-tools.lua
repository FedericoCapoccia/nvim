return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        server = {
            capabilities = capabilities,
        }
    end,
    config = function(_, opts)
        require("rust-tools").setup(opts)
    end
}
