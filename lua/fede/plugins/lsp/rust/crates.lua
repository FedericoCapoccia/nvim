return {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
        local crates = require("crates")
        crates.setup(opts)
        crates.show()
        local keymap = vim.keymap.set
        keymap("n", "<leader>rcu", function() crates.upgrade_all_crates() end)

    end,
}
