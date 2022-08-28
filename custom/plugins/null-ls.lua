local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

-- local b = null_ls.builtins

local sources = {
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.completion.spell,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
