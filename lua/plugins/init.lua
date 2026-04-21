local plugins = {
    "theme",
    "lualine",
    "oil",
    "conform",
    "treesitter",
    "fzf",
    "completion",
    "whichkey",
    "lsp",
}

for _, plugin in ipairs(plugins) do
    require("plugins." .. plugin)
end
