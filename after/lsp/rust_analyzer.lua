return {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = true,
            check = {
                command = "clippy",
            },
            completion = {
                callable = {
                    snippets = "none", -- disables function argument placeholders
                },
            },
            inlayHints = {
                bindingModeHints = { enable = false },
                chainingHints = { enable = false },
                closingBraceHints = { enable = false },
                closureCaptureHints = { enable = false },
                closureReturnTypeHints = { enable = "never" },
                discriminantHints = { enable = "never" },
                expressionAdjustmentHints = { enable = "never" },
                implicitDrops = { enable = false },
                lifetimeElisionHints = { enable = "never" },
                parameterHints = { enable = false },
                rangeExclusiveHints = { enable = false },
                reborrowHints = { enable = "never" },
                typeHints = { enable = false },
            },
        },
    },
}
