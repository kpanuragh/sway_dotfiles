local M = {}

M.treesitter = {
	ensure_installed = {
		"lua",
		"html",
		"css",
		"php",
		"phpdoc",
		"python",
		"typescript",
		"javascript",
		"jsdoc",
		"json",
		"scss",
    "go"
	},
}

M.nvimtree = {
	git = {
		enable = false,
	},
	view = {
		side = "left",
		width = 20,
	},
}
M.telescope = function()
	return {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--no-ignore-vcs",
			},
		},
	}
end

return M
