return {

	["elkowar/yuck.vim"] = { ft = "yuck" },
	["andweeb/presence.nvim"] = {},
	["williamboman/mason.nvim"] = {
		config = function()
			require("plugins.configs.mason")
			require("custom.configs.mason")
		end,
	},
	["williamboman/mason-lspconfig.nvim"] = {},
	["goolord/alpha-nvim"] = {
		disable = false,
	},
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	["wbthomason/packer.nvim"] = {
		max_jobs = 10,
		git = { clone_timeout = 10 },
	},
	["Pocco81/DAPInstall.nvim"] = {},
	["mfussenegger/nvim-dap"] = {
		config = function()
			require("custom.plugins.dap")
		end,
		requires = {
			"Pocco81/DAPInstall.nvim",
		},
	},
	["rcarriga/nvim-dap-ui"] = {
		after = "nvim-dap",
		config = function()
			require("dapui").setup()
		end,
	},
	["theHamsta/nvim-dap-virtual-text"] = {
		after = "nvim-dap",
		enabled = true, -- enable this plugin (the default)
		enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
		highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
		highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
		show_stop_reason = true, -- show stop reason when stopped for exceptions
		commented = false, -- prefix virtual text with comment string
		only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
		all_references = false, -- show virtual text on all all references of the variable (not only definitions)
		filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
		-- experimental features:
		virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
		all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
		virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
		virt_text_win_col = nil,
	},
}
