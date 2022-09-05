local pluginConfs = require("custom.plugins.configs")

local M = {}

M.ui = {
	theme = "gruvbox",
}
M.plugins = {
	user = require("custom.plugins"),
	override = {
		["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
		["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
		-- ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
	},
}

return M