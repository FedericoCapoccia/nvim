return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local term = require("toggleterm")
		term.setup({
			size = 3,
			open_mapping = [[<C-t>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal",
		})
	end,
}
