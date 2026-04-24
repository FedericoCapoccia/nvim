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
        },
    },
}
