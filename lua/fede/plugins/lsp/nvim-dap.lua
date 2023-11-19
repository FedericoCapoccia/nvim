return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_initialized["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
		local keymap = vim.keymap.set
		keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
		keymap("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })
		keymap("n", "<leader>dt", "<cmd>DapTerminate>CR>", { desc = "Terminate the debugger" })
	end,
}
